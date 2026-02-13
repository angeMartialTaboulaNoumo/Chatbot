# Utilise une image Python légère
FROM python:3.9

# Créer un utilisateur 'user' pour Hugging Face (sécurité)
RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:${PATH}"

WORKDIR /app

# Copier les fichiers et installer les dépendances
COPY --chown=user . /app
RUN pip install --no-cache-dir -r requirements.txt

# IMPORTANT : Hugging Face expose le port 7860 par défaut
CMD ["python", "app.py"]
