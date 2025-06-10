#Installation d'une image officielle de Python
FROM python3.11-slim

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
CMD [ "Python", "manage.py", "runserver", "0.0.0.0:8000" ]