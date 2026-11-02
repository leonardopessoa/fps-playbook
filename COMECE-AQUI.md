# Comece aqui: mais FPS, sem precisar de experiência

Você não precisa entender nada de PC nem de IA. Você vai usar um chat de IA gratuito como guia. Ele analisa um relatório sobre o seu PC e diz o que fazer, um passo de cada vez.

**Tempo:** cerca de 30 minutos para a primeira parte.
**Custo:** grátis.
**Você precisa de:** um PC com Windows e um navegador.

## Três regras para ficar seguro

1. **Nada muda se você não mudar.** O relatório da Parte 2 só lê informações do seu PC.
2. **Se não entendeu um passo, não faça ainda.** Pergunte à IA: *"O que isso faz, o que pode dar errado e como eu desfaço?"*
3. **Nunca passe para a IA suas senhas, chaves de recuperação ou dados de cartão.** Ela não precisa disso. Se pedir, diga não.

A IA pode errar, mesmo parecendo ter certeza. Se algo parecer arriscado, pergunte a um amigo que entenda de PC.

## Parte 1: Meça seu FPS agora

Faça isso primeiro. Sem um número de "antes", você não vai saber se algo funcionou.

### Joga Counter-Strike 2? Use o mapa de benchmark

Esse mapa de CS2 é muito usado e roda sempre a mesma cena, então os números de antes e depois podem ser comparados de forma justa. Use para comparar o seu próprio PC: segundo o autor do mapa, os resultados não valem para partidas reais, porque o seu PC também simula o jogo inteiro.

1. Abra a [página do CS2 FPS BENCHMARK DUST2](https://steamcommunity.com/workshop/filedetails/?id=3240880604) e clique em **Inscrever-se**. Talvez seja preciso entrar na sua conta Steam.
2. Abra o CS2. Vá em **CONFIGURAÇÕES > Jogo** e ligue a opção **Ativar console de desenvolvedor**.
3. Abra o console com a tecla à esquerda do **1**, digite `fps_max 0` e aperte **Enter**. Isso tira o limite de FPS durante o teste. Aperte a mesma tecla para fechar o console.
4. Vá em **JOGAR > Mapas da Oficina** e inicie o benchmark. Se ele não aparecer, reinicie o CS2 e espere um minuto para o mapa baixar.
5. Não mexa em nada até terminar. Levou cerca de 2 minutos no nosso PC de teste.
6. Os resultados aparecem no console, em roxo. Procure uma linha assim:

   `[VProf] FPS: Avg=490.0, P1=174.1`

   **Avg** é o seu FPS médio, e **P1** é o seu 1% low, que mostra o quanto os piores momentos são ruins. Se o console não abrir, aperte a tecla à esquerda do **1** e role para cima se precisar.
7. Rode **3 vezes** e tire uma foto de cada resultado com o celular. Ignore a primeira rodada, que pode ser afetada pelo carregamento, e anote os números das outras duas.

Quando a IA perguntar seu FPS, passe esses números.

### Joga outro jogo?

1. Abra seu jogo e ligue o contador de FPS. Se não encontrar, pesquise na internet por "[nome do jogo] mostrar FPS". Se o jogo tiver um benchmark próprio, use esse.
2. Jogue por alguns minutos em um mapa ou fase que você conhece.
3. Anote seu FPS normal e o valor mais baixo a que ele chega durante uma troca de tiros.

## Parte 2: Crie o relatório sobre o seu PC

1. No topo da página deste repositório no GitHub, clique no botão verde **Code** e depois em **Download ZIP**.
2. Abra a pasta **Downloads**, clique com o botão direito no arquivo ZIP e escolha **Extrair Tudo** e depois **Extrair**.
3. Abra a nova pasta. Você deve ver arquivos chamados `audit.ps1` e `PLAYBOOK.md`. Se aparecer só outra pasta, abra essa pasta.
4. Clique com o botão direito em um espaço vazio da pasta e escolha **Abrir no Terminal**. Vai aparecer uma janela com texto. Isso é normal.
   - Não apareceu? Clique em **Mostrar mais opções** e procure **Abrir janela do PowerShell aqui**.
5. Copie a linha inteira abaixo, cole nessa janela clicando com o botão direito e aperte **Enter**:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\audit.ps1 -OutFile audit.txt
   ```

6. Espere o texto parar de rolar. Um novo arquivo chamado `audit.txt` vai aparecer na pasta.
7. Dê dois cliques em `audit.txt` e passe o olho. Ele lista as peças e configurações do seu PC. Apague o que não quiser compartilhar e salve.

Texto de erro em vermelho em uma ou duas seções geralmente não é problema. Continue assim mesmo e mostre para a IA se ficar preocupado.

## Parte 3: Peça ajuda à IA

1. Abra um chat de IA gratuito no navegador, como [Claude](https://claude.ai), [ChatGPT](https://chatgpt.com) ou [Gemini](https://gemini.google.com). Talvez seja preciso criar uma conta grátis.
2. Anexe `PLAYBOOK.md` e `audit.txt`. Procure um botão de clipe ou **+** perto da caixa de mensagem. Se não houver, abra cada arquivo, copie todo o texto e cole no chat. O `PLAYBOOK.md` está em inglês, mas a IA entende.
3. Copie a mensagem abaixo, preencha os colchetes e envie:

   > Sou totalmente iniciante. Use o PLAYBOOK.md em anexo para descobrir por que meu jogo poderia rodar mais rápido, usando o meu audit.txt em anexo. Responda em português do Brasil.
   >
   > Meu jogo: [nome do jogo]
   > Meu FPS agora: cerca de [número], caindo para cerca de [número] nas trocas de tiros
   > Outras plataformas de jogo ou anti-cheat que eu uso: [por exemplo, FACEIT, ou "nenhuma"]
   >
   > Explique tudo com palavras simples e me dê só as 3 coisas mais fáceis e seguras para tentar primeiro. Me passe um passo de cada vez, diga exatamente onde clicar, diga como desfazer e espere eu confirmar que funcionou antes do próximo passo. Avise claramente se algum passo for arriscado.

4. Faça um passo de cada vez. Travou? Tire uma foto da tela com o celular, envie para a IA e pergunte: *"O que eu faço agora?"*

## Parte 4: Veja se funcionou

Faça o mesmo teste da Parte 1, do mesmo jeito. Depois, passe os novos números para a IA e pergunte: *"Qual é o próximo passo, e vale o risco?"*

**Pode parar quando estiver satisfeito.** Se o seu FPS já estiver acima da taxa de atualização do monitor e o jogo estiver fluido, talvez você não precise de mais nada.

## Extra: as configurações de vídeo do CS2 do nosso exemplo

Estas são as configurações do PC de exemplo do [README](README.md). Elas se baseiam no que os profissionais costumam usar, e é seguro testar porque dá para voltar atrás pelo menu.

1. No CS2, tire uma foto com o celular das suas configurações de vídeo atuais, para poder voltar depois.
2. Vá em **CONFIGURAÇÕES > Vídeo** e abra **Avançado**.
3. Mude estas opções e rode de novo o benchmark da Parte 1:

| Configuração | Nosso valor | Mais comum entre profissionais |
|---|---|---|
| Modo de exibição | Tela cheia | Fora da pesquisa |
| Aumentar contraste dos jogadores | Ligado | Ligado |
| Qualidade global das sombras | Alta | Alta |
| Sombras dinâmicas | Todas | Todas |
| Detalhe dos modelos e texturas | Alto | Baixo |
| Detalhe dos sombreadores | Baixo | Baixo |
| Detalhe das partículas | Baixo | Baixo |
| Oclusão de ambiente | Desativado | Desativado |
| High Dynamic Range | Qualidade | Qualidade |
| Antisserrilhado de múltiplas amostras | MSAA 4x | MSAA 8x |
| Modo de filtragem das texturas | Anisotrópico 4X | Bilinear |
| FidelityFX Super Resolution | Desativado | Fora da pesquisa |
| Modo de baixa latência (NVIDIA Reflex) | Ativado | Fora da pesquisa |

A coluna dos profissionais vem de uma pesquisa de 2025 com 40 jogadores. O que você enxerga vale mais do que qualquer tabela, então, se ficar difícil ver os jogadores, volte a opção. Deixe **Sombras dinâmicas em Todas**, porque as sombras podem entregar os inimigos.

## Antes de correr atrás de mais FPS

O que aprendemos no nosso PC de exemplo, para você economizar tempo:

- **Não presuma que um programa está fechado.** Dois programas que o dono achava que não estavam rodando estavam ativos em segundo plano. Peça para a IA verificar.
- **Ajustes extremos podem não mudar nada.** Apertar os tempos da RAM levou horas de teste e não trouxe ganho mensurável de FPS. Um dos ajustes mais apertados nem deixou o PC ligar.
- **Overclock de CPU geralmente não compensa para jogos.** No melhor teste que encontramos, ele rendeu cerca de 2% de FPS ou menos, com bem mais calor em carga máxima.
- **Diferenças pequenas não contam.** Rode o benchmark algumas vezes. Nossas rodadas variaram cerca de 8 FPS sozinhas, então não confie em uma mudança menor que a sua variação normal.
- **Se um dia precisar testar a RAM,** baixe a imagem USB atual do MemTest86, não a antiga "V4". Se o PC voltar para a BIOS em vez de iniciar o teste, talvez seja a versão errada, então mostre para a IA o que há no seu pendrive primeiro.

## Sinais de alerta

**Pare e peça ajuda a alguém que entenda de PC se:**
- A IA mandar você entrar na **BIOS**, a tela de configurações que aparece antes do Windows iniciar, e você se sentir inseguro. É ali que podem estar os ganhos maiores, mas um erro pode impedir o PC de ligar. A maioria dos problemas tem solução, mas vá com calma.
- A IA sugerir atualizar a BIOS. Não desligue o PC durante a atualização.
- A IA pedir para desligar a **Segurança do Windows** ou o antivírus. Diga não.
- A IA pedir para desligar **VBS, Secure Boot ou TPM**. Veja antes as regras do seu anti-cheat, porque você pode ficar sem acesso ao jogo.
- A IA pedir para baixar uma ferramenta de "otimização" ou "booster" que você nunca ouviu falar. Diga não até alguém de confiança verificar.
- O PC começar a travar ou reiniciar depois de uma mudança. Desfaça a última mudança e avise a IA.

**Está em um notebook?** Muitas das correções maiores não se aplicam, e o calor importa mais. Avise a IA que é um notebook.

## Palavras que você vai ver

| Palavra | O que significa |
|---|---|
| **FPS** | Quadros por segundo. Quanto maior, geralmente mais fluido |
| **1% lows** | O quanto os piores momentos são ruins. Números baixos parecem travadas |
| **Hz (taxa de atualização)** | Quantas vezes por segundo o monitor atualiza a imagem |
| **CPU** | O processador. Em muitos jogos competitivos, é ele que limita o FPS |
| **GPU** | A placa de vídeo |
| **RAM** | Memória rápida de curto prazo. Muitas vezes roda abaixo da velocidade anunciada até você ativar o perfil dela |
| **BIOS** | A tela de configurações que aparece antes do Windows iniciar |
| **XMP / DOCP / EXPO** | Uma opção da BIOS que faz a RAM rodar na velocidade anunciada |
| **Overclock** | Fazer peças rodarem acima da velocidade especificada, o que pode deixar o PC instável |
| **Driver** | Programa que faz o Windows se comunicar com uma peça, como a placa de vídeo |

## Quer a versão técnica?

Veja o [README.md](README.md) para os resultados de exemplo e o [PLAYBOOK.md](PLAYBOOK.md) para as instruções completas da IA. Os dois estão em inglês.
