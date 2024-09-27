# Use the jupyter/minimal-notebook image as the parent image
FROM jupyter/minimal-notebook:latest

# Install required dependencies
RUN pip install --no-cache-dir \
    jupyter \
    openeo>=0.31.0 \
    requests>=2.31.0 \
    rasterio>=1.4.0 \
    numpy>=1.26.1 \
    matplotlib>=3.8.1 \
    scikit-image>=0.22.0

# Set the working directory to /src
WORKDIR /src

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Define environment variable
ENV NAME World

# # Copy the current directory contents into the container at /app
# COPY . /src

# Mount the host machine directory into the container
VOLUME /src

# Run Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]