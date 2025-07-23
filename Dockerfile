FROM python:3.11-slim

WORKDIR /site

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install mkdocs if not in requirements.txt
RUN pip install --no-cache-dir mkdocs

# Copy the rest of the site files
COPY . .

# Build the mkdocs site
RUN mkdocs build
