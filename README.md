Per far funzionare la searchbar e tutto dovete installare Docker da qui https://www.docker.com/

Fate questo da terminale 
> docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.17.8


e assicuratevi che su docker vi appare una riga con docker.elastic.co/elasticsearch....

dopo aprite il terminale nella cartella del progetto, fate rails c e Ristorante.reindex

Una volta che non dovete più usarlo potete chiudere docker e per riaprirlo basta solo farlo partire dal pulsante di docker