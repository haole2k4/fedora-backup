# Trước tiên phải cài ollama
sudo dnf install ollama

# Và cài thêm llm-chekcer qua npm
npm install -g llm-checker

# Đối với deepseek-r1:7B
ollama pull nomic-embed-text

podman run -d -p 3000:8080 \
  -e OLLAMA_API_BASE_URL=http://host.containers.internal:11434 \
  -v open-webui:/app/backend/data:Z \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

