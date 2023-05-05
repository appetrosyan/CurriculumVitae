\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CurriculumVitae}[2018/12/08]
\PassOptionsToPackage{svgnames}{xcolor}

%% Passing options through to articles
\DeclareOption{10pt}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{11pt}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{12pt}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{a4paper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{a5paper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{b5paper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{letterpaper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{legalpaper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{executivepaper}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\DeclareOption{landscape}
{
  \PassOptionsToClass{\CurrentOption}{article}
}


\DeclareOption{titlepage}
{
  \PassOptionsToClass{\CurrentOption}{article}
}

\newcommand{\vseparator}{
{%
    \centering
      \pgfornament[height=0.03in, opacity=0.2]{86}%
    
  }%  
}


\newcommand{\job}[5]{
  {\large \textsc{#3}  (\textbf {#1 -- #2}) \normalsize} \hfill \textbf{#4}
  
  \vspace{0.03in}
  #5
  \vspace{0.13in}
}

\newenvironment{skills}[1]{
  \textsc{#1}
    \begin{itemize}[topsep=0pt, partopsep=0pt, leftmargin=1em, itemindent=0.3em]
      \setlength{\itemsep}{-0.3em}
  }
  {
  \end{itemize}
  \vspace{1em}
}

% \providecommand{\job}[5]
% {
%   \bipart{\textbf{#2} \textbf{#1}}
%   {\large \textsc{#3} \normalsize \hfill \textbf{#4}

%     \vspace{0.07in}
%     #5

%     \hfill
%     \begin{minipage}[h]{0.85\textwidth}
      
%     \end{minipage}

%   }
% }

\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{titling}
\RequirePackage{hyperref}
\RequirePackage{siunitx}
\RequirePackage{titlesec}
\RequirePackage{listings}


\lstset{%
  basicstyle=\ttfamily,
}

\addtolength{\oddsidemargin}{-1.275in}
\addtolength{\evensidemargin}{-1.365in}
\addtolength{\textwidth}{2.45in}
\addtolength{\topmargin}{-1.25in}
\addtolength{\textheight}{1.75in}
\setlength{\parindent}{0in}
\addtolength{\baselineskip}{-0.33in}
\addtolength{\parskip}{-0.25em}
\addtolength{\columnsep}{-5em}


\newcommand{\sectionline}[2]{%
  \pgfornament[color = #1]{#2}
}

\titleformat{\section}
{\vspace{-2em}\Large\scshape\filcenter}
{\thesection}{0.0em}{}[\sectionline{black}{89}]

\newcommand{\email}[1]
{
  \href{mailto:#1}{\textsc{#1}}%
}

\newcommand{\phone}[3]
{
  \href{tel:#1#2#3}{+#1--#2--\num{#3}}%
}

\newcommand{\address}[5]%
{%
  #1,
  #2,
  
  \texttt{#3}~\emph{#4}, \textsc{#5}%
}

\newcommand{\bipart}[2]
{
  \noindent%
  \begin{minipage}[h]{0.06\textwidth}
    #1
  \end{minipage}%
  \vrule \hspace{0.15in}%
  \begin{minipage}[h]{0.85\textwidth}
    #2
  \end{minipage}%
  \vspace{0.15in}%
  \normalsize%
}

\newcommand{\project}[4]
{
  {\setlength{\parindent}{0in}
  % \bipart{\textbf{#2}}
  { \large
    \textsc{#1}
    \footnotesize
    \hfill \href{http://#3}{\textsf{#3}}}
  \hrule
    \nopagebreak
    \vspace{0.04in}
    \footnotesize
    #4
    \vspace{0.07in}
    
    
  \normalsize
  }
}


\newcommand{\education}[6]
{
  % \bipart{\textbf{#2} \textbf{#1} }
  {\setlength{\parindent}{0in}%
  {\large \textsc{#3} (\textbf{#1 -- #2})  \normalsize \hfill \textbf{#4}

    \textbf{#5}
    \vspace{0.07in}

    \normalsize
    
    #6}
}
\vspace{0.21in}
}


\newcommand{\coverletter}
{
  Sample Coverletter. You should sell yourself as a capable young rascal. To change this, please \lstinline{$x^2 + y^2 = r^2$}
}

\newcommand{\award}[3]{%
  {\setlength{\parindent}{0in}%
    \textsc{#2} --- \textbf{#1}  \hfill \textsc{#3}%
    \vspace{0.3em}%
  }
}

\newcommand{\myhomephone}{}
\newcommand{\mymobilephone}{}
\newcommand{\myhomeaddress}{}
\newcommand{\myworkaddress}{}
\newcommand{\myemail}{}
\newcommand{\myGitHub}{}
\newcommand{\aboutme}{About me}
\newcommand{\contactme}{Contact info.}

\newcommand{\examtype}[1]%
{%
  \emph{{\textsc {#1}}}%
}%

\newcommand{\term}[1]%
{%
  \lstinline{#1}%
}%
    


\renewcommand{\maketitle}{
  {\setlength{\parindent}{0in}
  \begin{minipage}[t]{.95\textwidth}
    \Huge  \textsc{\theauthor}
  \end{minipage}
  \vspace{0.1in}
  \hrule
  \begin{minipage}[t]{0.65\textwidth}
    \vspace{0.1in}
    % \begin{center}
      
        \textbf{\aboutme}
        
    % \end{center}
    \small
    \coverletter
  \end{minipage}
  \hspace{0.03\textwidth}
  \vrule
  \hspace{0.03\textwidth}
  \begin{minipage}[t]{.33\textwidth}
    \vspace{0.1in}
    \begin{center}
      \textbf{\contactme}
    \end{center}
    \footnotesize
    \myemail%
    
    \mymobilephone%

    \myhomephone%

    \myhomeaddress%

    \myworkaddress%

    \myGitHub%
    
  \end{minipage}
  \normalsize
  }
}

\newcounter{pagecount}
\newcommand{\limitpages}[1]{
    \setcounter{pagecount}{0}%
    \gdef\maxpages{#1}%
    \ifx\latex@outputpage\@undefined\relax%
        \global\let\latex@outputpage\@outputpage%
    \fi%
    \gdef\@outputpage{%
        \addtocounter{pagecount}{1}%
        \ifnum\value{pagecount}>\maxpages\relax%
            % Do not output the page
        \else%
            \latex@outputpage%
        \fi%
    }%
}

\pagenumbering{gobble}