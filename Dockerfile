FROM ubuntu:latest

# Atualiza e instala o binutils e o gcc logo na criação da imagem
RUN apt-get update && apt-get install -y binutils gcc

# Define a pasta de trabalho padrão
WORKDIR /workspace