#Installation d'une image officielle de Python
FROM python:3

#Installer les dependances systeme pour mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    build-essential \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

#Definir le repertoire de travail
WORKDIR /app

#Copier les fichiers du projet
COPY . /app

#Installer les dependance
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

#exposervle port utilise par Django
EXPOSE 8000

#lancer le serveur django
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]