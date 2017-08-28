# Victicia-videos

Projeto desenvolvido com Vue.js, Webpack, cucumber, capybara e Youtube API

## Executando
```bash
# Instalando as dependências
npm install

# Executando no modo desenvolvimento
npm run dev

# Executando para produção
npm run build

# Executando para produção e visualizar reporte 
npm run build --report

```

## Testes de aceitação (Cucumber)

### Como rodar

1. Instalando ruby

    ``` 
    $ sudo apt-get install ruby-full
    $ sudo apt-get install build-essential patch
    $ sudo apt-get install ruby-dev zlib1g-dev liblzma-dev 
    ```
    
2. Download [Selenium Drive][1]
3. Necessário adicionar no PATH a pasta que contém o Selenium drive
4. Acessando a pasta dos testes de aceitação
	```
	$ cd ficticia-video/test/cucumber
	
	```
4. Instalando cucumber: 

	``` 
	$ gem install cucumber 
	```

5. Instalando bundle: 
	``` 
	$ gem install bundler 
	```

6. Finalmente, vá ao diretório deste projeto e execute
	```
	$ cucumber browser=chrome
	``` 

[1]: http://www.seleniumhq.org/download/
  