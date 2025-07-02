FROM python:3.13.4-alpine3.22

# 2. Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copia o arquivo de dependências para o diretório de trabalho
# Fazemos isso antes de copiar o resto do código para aproveitar o cache do Docker.
COPY requirements.txt .

# 4. Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# 6. Expõe a porta em que a aplicação será executada
EXPOSE 8000

# 7. Define o comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
