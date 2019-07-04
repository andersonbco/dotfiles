#!/usr/bin/env bash

# nome do arquivo com a lista de arquivos/pastas a serem ignorados no script
IGNORE_FILE="import.ignore"

# verifica se o arquivo existe e não está vazio
if [ -s ${IGNORE_FILE} ]; then
  # usa awk para contar o total de linhas do arquivo, pois o "wc -l" ignora a
  # última linha quando não existe um line break no final do arquivo
  line_count=$(awk 'END {print NR}' ${IGNORE_FILE})
  current_line=0

  # monta uma string com os arquivos/pastas que serão excluídos do find
  # o [ -n "$line" ] é um workaround para que o read possa ler a última linha
  # corretamente quando não existe um line break no final do arquivo
  while read -r line || [ -n "$line" ]; do
      if [ -d "$line" ]; then
        # ignora diretório
        ignore="${ignore} -path ./${line} "
      else
        # ignora arquivo
        ignore="${ignore} -iname ${line} "
      fi
      ((current_line++))

      # adiciona o "-o" entre os nomes dos arquivos/pastas
      # não adiciona quando for a última linha
      # "-o" é o argumento do find equivalente ao operador "or"
      if [ $line_count -ne $current_line ]; then
        ignore="${ignore}-o "
      fi
  done < ${IGNORE_FILE}

  # formata a String que será passada como argumento para o find
  ignore="(${ignore} ) -prune -o"
fi

# o find adiciona um ponto no início de todos os arquivos/pastas que ele encontra
# o sed abaixo serve para remover esse ponto e substituí-lo pelo diretório de origem/destino
# sed "s|^.\{1\}|${DIR}|g"

# monta a estrutura de pastas na $HOME do sistema
find . ${ignore} -type d -print | sed "s|^.\{1\}|${HOME}|g" | xargs mkdir -p

# cria os links simbólicos para os dotfiles
find . ${ignore} -type f -print0 |
  while IFS= read -r -d '' line; do
    origin=$(echo ${line} | sed "s|^.\{1\}|$(pwd)|g")
    destination=$(echo ${line} | sed "s|^.\{1\}|${HOME}|g")
    ln -sf ${origin} ${destination}
  done