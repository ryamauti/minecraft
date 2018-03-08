# minecraft
Comandos para subir um servidor de Minecraft na AWS, mais ou menos automaticamente
*alterar o nome do <bucket>

```
sudo yum -y install java-1.8.0
sudo yum -y remove java-1.7.0-openjdk
sudo yum -y update
mkdir minecraft
cd minecraft
wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar
java -Xmx1024M -Xms1024M -jar minecraft_server.1.12.2.jar nogui
echo "eula=true" >> eula.txt
aws s3 cp s3://<bucket>/worlddata.zip .
unzip worlddata.zip
echo "Iniciando o Minecraft Server..."
echo "para fechar o Minecraft, o comando eh stop"
java -Xmx1024M -Xms1024M -jar minecraft_server.1.12.2.jar nogui
echo "lembre-se do backup do mundo..."
echo "zip -r worlddata.zip world"
echo "aws s3 cp worlddata.zip s3://<bucket>/worlddata.zip"
```
