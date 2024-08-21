---
layout: page
title: Deployment methods and virtualization in Linux systems
permalink: /TeachingMaterials/DockerBasics
menubar: false
nav_exclude: true
exclude: true
nav: false
---


Containers are separated sections of the Linux kernel that logically act as different machines to each other. Communication between containers, for example, is only possible in the same way two machines would communicate with each other. Namely over a network interface.

### Using control groups for separating resources

[*Control groups*](https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v2.html) are one pillar for creating isolated environments in Linux. With cgroups, one can set limits on how many resources a process or a group of processes is allowed to consume. There are cgroup subsystems for each type of resource that can be limited, such as:

- Memory
- CPU time
- Block I/O
- Process count
- CPU & memory pinning
- Freezer
- Devices
- Network priority
- etc.

Each subsystem is independent of each other. A cgroup has hierarchies, inheriting its limits to child processes. There is also the option to have dedicated limits for each hierarchy tier. Practically, the available cgroups can be listed on a Linux system as seen in Listing 1.

```bash
$ ls /sys/fs/cgroup/
blkio  cpuacct  devices  hugetlb  misc     net_prio    pids  unified
cpu    cpuset   freezer  memory   net_cls  perf_event  rdma
```
*Listing 1: List of available cgroups in a virtual filesystem of the Linux kernel. Can vary based on distribution*

In each directory, there is a `tasks` file that assigns PIDs to that cgroup. Depending on the subsystem, there are additional files where various limits can be set.

To get all the cgroups from a given PID, a lookup to the `/proc` virtual filesystem is necessary, as seen in Listing 2. By writing the current PID into a cgroup file, the cgroup gets applied to that process.

```bash
max@jetengine:/sys/fs/cgroup$ echo $$
370
max@jetengine:/sys/fs/cgroup$ cat /proc/370/cgroup
29:name=systemd:/
28:misc:/
27:rdma:/
26:pids:/
25:hugetlb:/
24:net_prio:/
23:perf_event:/
22:net_cls:/
21:freezer:/
20:devices:/
19:memory:/
18:blkio:/
17:cpuacct:/
16:cpu:/
15:cpuset:/
0::/
```
*Listing 2: Assigned cgroups of the current bash process with the PID 370*

### Partitioning kernel resources using Linux namespaces

Cgroups handle what a given process can **access**. Namespaces manage what the process can **see**. They are available for:

- Network
- Filesystem mounts
- Processes
- Inter-process communication
- Hostname and Domain name
- User and group IDs
- cgroups

For other areas, there is active development to integrate them into namespaces as well. Processes can share different namespaces in different categories. For example, they can run on the same network but different filesystem mounts. For **containers**, the mount namespace is of particular importance. Since containers come with their own software, this gets mounted in that namespace to allow for a separate and controlled environment. In containers, they are called volumes. 

Namespaces can be managed with the `clone` and `unshare` [syscalls](https://www.man7.org/linux/man-pages/man7/namespaces.7.html). With `clone`, a new process can create a new namespace, while `unshare` lets existing processes create new namespaces. With `nsenter` and `ip-netns`, existing namespaces can be entered. To run a single command in a new network namespace, the `ip link` command can be used, as shown in Listing 3. To create a **container**, the command [systemd-nspawn](https://www.freedesktop.org/software/systemd/man/latest/systemd-nspawn.html) can be used. Although in practice, tools like [docker](https://www.docker.com/) or [podman](https://podman.io/) are easier to use. THey use these and other commands/syscalls internally. 

```bash
max@jetengine:/$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 00:15:5d:be:06:00 brd ff:ff:ff:ff:ff:ff

max@jetengine:/sys/fs/cgroup$ sudo unshare --net ip link
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
```
*Listing 3: Assigned network interfaces on the main machine and in a namespace*

This immediately leaves the namespace again since there is no process running in it when the `ip link` command finishes. When opening a bash session, the namespace persists as long as the bash session is active. The shell commands for opening a bash session in a new namespace are shown in Listing 4.

```bash
max@jetengine:/sys/fs/cgroup$ sudo unshare --net bash
root@jetengine:/sys/fs/cgroup#
```
*Listing 4: Entering a new namespace as long as the initialized bash session is active*

When entering the namespace, as seen in Listing 4, a `#` appears in the prompt, indicating the user is inside the namespace. When running `docker exec bash`, the same `#` will be displayed.

## Using Docker as a container engine to create Linux namespaces
Docker and namespaces are closely related. Docker uses namespaces to create isolated environments (containers). For example, a Ubuntu container can be created using the command shown in Listing 5. To check if the container is running, the `docker ps` command can be used, as seen in Listing 6.

```bash
max@jetengine:~$ docker run -it ubuntu bash
root@a74b66bd26b2:/#
```
*Listing 5: Create a new Ubuntu container and run bash within it via Docker*

```bash
max@jetengine:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS          PORTS     NAMES
a74b66bd26b2   ubuntu    "bash"    17 seconds ago   Up 16 seconds             zen_neumann
```
*Listing 6: Show all currently running containers*

## Using docker compose to run and configure multiple containers

THe `docker run` command is useful for creating a new container that needs to be used only once. If multiple containers need to be used, all depending on each other a compose file is more suitable.

To transition from `docker run` to compose, the website [composerize](https://www.composerize.com/) is a great tool. It shows the relation between the two ways of describing containers. 

The specification of docker compose files can be seen [here](https://docs.docker.com/reference/compose-file/).

