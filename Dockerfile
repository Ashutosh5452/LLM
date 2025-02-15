FROM python:3.13-slim-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
RUN pip install fastapi uvicorn
ENV PATH="/root/.local/bin:$PATH"
WORKDIR /app
COPY app.py /app
CMD ["/root/.local/bin/uv", "run", "app.py"]