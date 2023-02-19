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
\ProvidesClass{libellum}[2023/02/18 v.0.1.0 
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

% matemática geral -------------------------------------------------------
\RequirePackage{amsmath, amssymb, amsthm} %---------------> pacotes da AmS
\RequirePackage{mathtools} %------------------> melhoras do pacote amsmath

% seleção de cores -------------------------------------------------------
\RequirePackage{xcolor}
  \definecolor{douradoUFRB}{rgb}{0.929411765, 0.603921569, 0.066666667} 
  \definecolor{azulUFRB}{rgb}{0.160784314, 0.08627451, 0.435294118}

% 3. CONFIGURAÇÕES DAS ESTRUTURAS ==========================================

% 4. NOVOS COMANDOs ========================================================
% negrito sem serifa -----------------------------------------------------
\newcommand{\textbs}[1]{%
  \textsf{ \textbf{ \textcolor{azulUFRB}{ #1 } } }
}
% itálico sem serifa -----------------------------------------------------
\newcommand{\textis}[1]{% 
  \textsf{ \textit{ #1 } }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================%
% HISTÓRICO DA CLASSE                                                      %
%==========================================================================%
%     (2023-02-18)  ::  Essa classe foi concebida para escrita de futuras  %
%                       notas de aula ou pequenos textos, ambos com ferra- %
%                       mentas para Matemática.                            %
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











