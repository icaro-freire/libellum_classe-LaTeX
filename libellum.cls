%==========================================================================%
% libellum.cls                                                             %
% Copyright (c) 2023 Ícaro Vidal Freire.                                   %
%--------------------------------------------------------------------------%
% Versão     : v0.1.0                                                      %
% Licença    : LPPL 1.3c (LaTeX Project Public License v1.3c) ou superior  %
%              (fica a seu critério).                                      %
%              Para mais informações, acesse:                              %
%                 >>  https://www.latex-project.org/lppl/lppl-1-3c/  <<    %
% Mantenedor : Ícaro Vidal Freire                                          %
% Descrição  : Classe, em LaTeX2e, para confecção de pequenos textos, como %
%              notas de aula.                                              %
%              - Libellum, em latim, significa "Livreto"                   %
% Como Usar  : A classe foi escrita em LaTeX2e para composição tipográfica %
%              com o mecanismo LuaTeX. Portanto, deve-se usar o LuaLaTeX   %
%              para execução.                                              %
%--------------------------------------------------------------------------%
%                      _         _____   __  __                            %
%                     | |    __ |_   _|__\ \/ /                            %
%                     | |   / _` || |/ _ \\  /                             %
%                     | |__| (_| || |  __//  \                             %
%                     |_____\__,_||_|\___/_/\_\                            %
%==========================================================================%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. IDENTIFICAÇÕES INTERNAS ===============================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{libellum}[2023/02/18 v0.1.0 
  'Classe para confecção de pequenos textos, como notas de aula'
]
\LoadClass[12pt]{book}

% 2. PACOTES USADOS ========================================================

% fontes & cia -----------------------------------------------------------
\RequirePackage{euler} %--------------------------------> fonte matemática
\RequirePackage{fontspec} %-------------> codificação ou selação de fontes
  \setmainfont[Ligatures=TeX]{TeX Gyre Pagella}
  \setsansfont[Scale=0.95]{Raleway}
  \setmonofont[Scale=MatchLowercase,FakeStretch=0.9]{TeX Gyre Cursor} 
  \newfontfamily{\terminal}[Scale=0.9]{FiraMono Nerd Font}
  \newfontfamily{\initial}{Royal Initialen}
\RequirePackage{lettrine} %--------------------------------> letra capital

% traduções/idioma/hifenação ---------------------------------------------
\RequirePackage[brazilian]{babel} 

% margens ----------------------------------------------------------------
\RequirePackage{geometry}
  \geometry{%
    %showframe,
    a4paper, 
    top    = 5.672cm,
    bottom = 5.672cm,
    left   = 1.532cm,
    right  = 6.489cm,
    marginparwidth = 4.957cm
  }

% matemática geral -------------------------------------------------------
\RequirePackage{amsmath, amssymb, amsthm} %---------------> pacotes da AmS
\RequirePackage{mathtools} %------------------> melhoras do pacote amsmath

% desenho, caixas & cia --------------------------------------------------
\RequirePackage{tcolorbox}
  \tcbuselibrary{skins}
  \usetikzlibrary{shadings}
\RequirePackage{tikz}
  \definecolor[named]{color01}{rgb}{0.160784314, 0.08627451, 0.435294118}

% seleção de cores -------------------------------------------------------
\RequirePackage{xcolor}
  \definecolor{douradoUFRB}{rgb}{0.929411765, 0.603921569, 0.066666667} 
  \definecolor{azulUFRB}{rgb}{0.160784314, 0.08627451, 0.435294118}

% seções, títulos & cia --------------------------------------------------
\RequirePackage{sectsty}
  \allsectionsfont{\sffamily\color{azulUFRB}}

% hyperlinks e metadados -------------------------------------------------
\usepackage{hyperref}
  \hypersetup
  {
    colorlinks   = true,
    allcolors    = douradoUFRB,
    linktoc      = all,
    pdfnewwindow = true,
    pdfproducer  = {LuaTeX},
    pdfcreator   = {LaTeX2e}, 
  }

% icones e ardornos ------------------------------------------------------
\RequirePackage{emoji}

% listas, tabelas e figuras ----------------------------------------------
% listas
\RequirePackage{enumitem}
  \setlist[itemize]{format=\textcolor{azulUFRB}}
  \setlist[description]{format=\textcolor{azulUFRB}}

% tabelas
\RequirePackage{tabularray}

% figuras 
\RequirePackage{graphicx}
  \graphicspath{{./figs}{./figs/img}}
\RequirePackage{caption}
  \captionsetup{
    labelfont = {bf, sf, color=azulUFRB}, 
    font      = {small, sf}
  }

% pano de fundo ----------------------------------------------------------
\RequirePackage{wallpaper}

% para notas nas margens verticais ---------------------------------------
\RequirePackage{marginnote}

% 3. CONFIGURAÇÕES DAS ESTRUTURAS ==========================================
% comando para capa ------------------------------------------------------
  % definições de variáveis para título (\titulo{}), autor (\autor{}) e 
  % tipo do documento (\tipo{})
  \def\titulo#1{\gdef\@titulo{#1}}
  \def\autor#1{\gdef\@autor{#1}}
  \def\tipo#1{\gdef\@tipo{#1}}
\newcommand{\capa}[2]{%
  %
  \thispagestyle{empty}
  \ThisCenterWallPaper{#1}{#2}
  %
  \begin{tikzpicture}[remember picture,overlay]
    \node[
      rectangle, rounded corners, fill=douradoUFRB!5, opacity=0.75, 
      anchor=south west, minimum width=4.957cm, minimum height=7.01cm
    ] (box) at (0,-15) (box){};
    \node[
      anchor=west, color01, xshift=-2cm, yshift=-0.4cm, text width=3.9cm, 
      font=\small\scshape\bfseries
    ] at (box.north){\@tipo};
    \node[
      anchor=west, color01, xshift=-2cm, yshift=-3cm, text width=3.9cm, 
      font=\sffamily\bfseries\Large
    ] at (box.north){\@titulo};
    \node[
      anchor=west, color01, xshift=-2cm, yshift=-6.3cm, text width=3.9cm, 
      font=\sffamily\bfseries
    ] at (box.north){\@autor};
  \end{tikzpicture}
  %
  \newpage
}

% ambiente para teoremas -------------------------------------------------
\tcbset{
  base/.style={
    empty,
    frame engine=path,
    colframe=azulUFRB!5,
    sharp corners,
    attach boxed title to top left={yshift*=-\tcboxedtitleheight},
    boxed title style={size=minimal, top=4pt, left=4pt},
    coltitle=douradoUFRB,fonttitle=\bfseries\sffamily,
  }
}

\newtcolorbox[auto counter, number within=section]{teorema}[1][]{%
  base,
  drop fuzzy shadow,
  borderline west={3pt}{-3pt}{douradoUFRB},
  title={Teorema~\thetcbcounter~#1}
}

% outros ambientes matemáticos -------------------------------------------
\theoremstyle{definition}
  \newtheorem{lema}{% 
    \color{azulUFRB} \sffamily Lema
  }[section]
  \newtheorem{prop}{% 
    \color{azulUFRB} \sffamily Proposição
  }[section]
  \newtheorem{cor}{%
    \color{azulUFRB} \sffamily Corollary
  }[section]
  \newtheorem{definicao}{%
    \color{azulUFRB} \sffamily Definição
  }[section]

% novo comando para sumário ----------------------------------------------
\newcommand{\sumario}{%
  \textsf{ \tableofcontents }
}

% 4. NOVOS COMANDOs ========================================================

% linkurl{}{} ------------------------------------------------------------
\newcommand{\linkurl}[1]{%
  \href{#1}{\color{douradoUFRB}\sffamily\bfseries #1}
}

% link em negrito --------------------------------------------------------
\newcommand{\link}[2]{%
  \href{#1}{% 
    {\footnotesize\emoji{link}}~\textcolor{douradoUFRB}{%
      \textbf{\textsf{#2}}}}\!\!
}

% negrito sem serifa -----------------------------------------------------
\newcommand{\textbs}[1]{%
  \textsf{ \textbf{ \textcolor{azulUFRB}{ #1 } } }
}
% itálico sem serifa -----------------------------------------------------
\newcommand{\textis}[1]{% 
  \textsf{ \textit{ #1 } }
}

% \parte{}, com mudança nas margens --------------------------------------
\newcommand{\parte}[1]{%
  \newgeometry{%
    a4paper, left=1.532cm, right=1.532cm, top=5.672cm, bottom=5.672cm
  }
  \part{#1}
  \restoregeometry
}

% \nota{} ----------------------------------------------------------------
\newcounter{mynote}%~\thetcbcounter
\newtcolorbox[use counter=mynote]
  {mynote}[1][]
  {title=Saiba Mais!,
   width=5cm,
   left=0pt,
   right=0pt,
   fonttitle=\bfseries\sffamily\color{azulUFRB},
   colframe=douradoUFRB,
   colback=douradoUFRB!34,
   #1
}    

\newcommand\nota[2][]{%
  \marginnote[\footnotesize #1]{%
    \makebox[0pt][l]{%
      \begin{mynote}%[label=#3]
        \footnotesize #2
      \end{mynote}}
  }%
}
 
% testes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\RequirePackage{sidenotes}



  % comando para colorir única página
  % \usepackage{pagecolor,afterpage}
  % \newpagecolor{douradoUFRB}
  %   texto
  % \restorepagecolor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================%
% HISTÓRICO DA CLASSE                                                      %
%==========================================================================%
%     (2023-02-20)  ::  Tentando criar uma configuração para \part{}.      %
%                       Ainda não estou satisfeito, pois queria colorir    %
%                       apenas a página do nome PARTE I; mas, pela estru-  %
%                       tura do comando original, a página anterior e a    %
%                       posterior acabam sendo coloridas.                  %
%                       * \nota{}, para informações curiosas, etc.         %
%                       * \parte{}, com mudança na margem                  %
%                                                                          %
%--------------------------------------------------------------------------%
%     (2023-02-19)  ::  Resolvendo problemas na capa e margens             %
%                       * comandos para capa concluídos                    %
%                         - são 5 tipos de imagens disponíveis: escada;    %
%                           gotas; gravidade; livros ou montanha           %
%                         - \titulo{}, \author{} e \tipo{} comandos prontos%
%                       * comando provisório para capa \capa{}{}, com dois %
%                         argumentos: proporção e figura                   %
%                       * margem com proporção áurea em diversos itens:    % 
%                         comprimento, largura e margem vertical           %
%                                                                          %
%--------------------------------------------------------------------------%
%     (2023-02-18)  ::  Essa classe foi concebida para escrita de futuras  %
%                       notas de aula ou pequenos textos, ambos com ferra- %
%                       mentas para Matemática.                            %
%                       * Mudança de cor em listas                         %
%                       * Novos comandos: \link{}{} e \linkurl{}           %
%                       * Hyperlinks e metadados básicos e                 %
%                       * Novo comando para sumário (sem sefira)           %
%                       * Capítulos e seções sem serifa e em azulUFRB      %
%                       * Outros ambientes matemáticos definidos           %
%                       * Assentado ambiente para Teoremas                 %
%                       * Pacotes para expressões Matemáticas gerais       %
%                         - amsmath, amssym e amsthm                       %
%                         - mathtools                                      %
%                       * Escolha das fontes (em construção)               %
%                         - TeX Gyre Pagella   : fonte serifada            %
%                         - Raleway            : fonte sem serifa          %
%                         - TeX Gyre Cursor    : fonte monoespaçada        %
%                         - FiraMono Nerd Font : fonte monoespaçada        %
%                         - Royal Initialen    : fonte para letra capital  %
%==========================================================================%
