# Este script serve para instalar o jogo em um servidor limpo
# E abre o jogo na porta default 25565
# apos a primeira rodada, sh ./minecraftserver/revelation/ServerStart.sh para iniciar o servidor
# apos a primeira rodada, ./minecraftserver/revelation/server.properties gerencia propriedades do servidor
# FTB Utilities faz backup a cada duas horas por default do arquivo do mundo

# cria o diretorio
mkdir minecraftserver/revelation
cd minecraftserver/revelation

# baixa o FTBRevelation
wget https://media.forgecdn.net/files/2545/327/FTBRevelationServer_1.8.0.zip
unzip FTBRevelationServer_1.8.0.zip

# muda a configuracao local para 6 GB RAM
echo 'export MAX_RAM="6144M"' > settings-local.sh

# insere nova linha no ServerStart para regerar a EULA
sed -i '/read ignored/a\    echo "eula=true" >> eula.txt' ServerStart.sh

# altera o ServerStart para nao esperar o enter
sed -i 's/read ignored/#read ignored/g' ServerStart.sh

# inicia o servidor
sh ./ServerStart.sh

# FIM
