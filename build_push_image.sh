# Membuat docker image dengan tag item-app:v1
docker build -t item-app:v1 .

# melihat daftar images
docker images


# *********************************
# STEPS JIKA MENGGUNAKAN GITHUB CR
# *********************************

# copy image agar sesuai dengan nama format Github CR
docker tag item-app:v1 ghcr.io/mfdsix/item-app:v1

# Login ke image registry
echo GITHUB_PERSONAL_ACCESS_TOKEN | docker login ghcr.io -u mfdsix --password-stdin

# Push image ke Github CR
docker push ghcr.io/mfdsix/item-app:v1



# *********************************
# STEPS JIKA MENGGUNAKAN DOCKER HUB
# *********************************

# copy image agar sesuai dengan nama format Docker Hub
docker tag item-app:v1 mfdsix/item-app:v1

# Login ke image registry
docker login

# Push image ke Docker Hub
docker push mfdsix/item-app:v1