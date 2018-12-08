\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CurriculumVitae}[2018/12/08]
\LoadClass{article}
\RequirePackage{titling}
\RequirePackage{hyperref}
\RequirePackage{siunitx}
\RequirePackage{titlesec}
\RequirePackage{listings}

\addtolength{\oddsidemargin}{-1.275in}
\addtolength{\evensidemargin}{-1.365in}
\addtolength{\textwidth}{2.45in}
\addtolength{\topmargin}{-1.0in}
\addtolength{\textheight}{1.3in}

\titleformat{\section}
{\Large\scshape\filcenter}
{\thesection}
{1em}
{\hrule}

\newcommand{\email}[1]
{
  \href{mailto:#1} {\textsc{#1}}
}

\newcommand{\phone}[3]
{
  \href{tel:#1#2#3}{+#1--#2--\num{#3}}
}

\newcommand{\address}[5]
{
  #1,
  #2,
  
  \texttt{#3}~\emph{#4}, \textsc{#5}
}

\newcommand{\bipart}[2]
{
  \noindent
  \begin{minipage}[h]{0.06\textwidth}
    #1
  \end{minipage}
  \vrule \hspace{0.15in}
  \begin{minipage}[h]{0.85\textwidth}
    #2
  \end{minipage}
  \vspace{0.15in}
  \normalsize
}

\newcommand{\project}[4]
{
  \bipart{\textbf{#2}}
  { \large
    ``\textsc{#1}''
    
    \normalsize
    #4
    
    
    \footnotesize
    \hfill \href{http://#3}{\textsf{#3}}}
}


\newcommand{\education}[6]
{
  \bipart{\textbf{#2} \textbf{#1} }
  {\large \textsc{#3}  \normalsize \hfill \textbf{#4}

    \textbf{#5}
    \vspace{0.07in}

    \normalsize
    #6}
}


\newcommand{\coverletter}
{
  Sample Coverletter. You should sell yourself as a capable young rascal. To change this, please \lstinline{$x^2 + y^2 = r^2$}
}

\newcommand{\job}[5]
{
  \bipart{\textbf{#2} \textbf{#1}}
  {\large \textsc{#3} \normalsize \hfill \textbf{#4}

    \vspace{0.07in}
    #5

    \hfill
    \begin{minipage}[h]{0.85\textwidth}
      
    \end{minipage}

  }
}

\newcommand{\award}[3]{
  \bipart{\textbf{#1}}
  {\large \textsc{#2} \normalsize \hfill \textbf{#3}}
}



\renewcommand{\maketitle}{
  \begin{minipage}[t]{.95\textwidth}
    \Huge  \textsc{\theauthor}
  \end{minipage}
  \vspace{0.1in}
  \hrule
  \begin{minipage}[t]{0.6\textwidth}
    \vspace{0.1in}
    \begin{center}
      \textbf{About me}
    \end{center}
    \small
    \coverletter
  \end{minipage}
  \hspace{0.03\textwidth}
  \vrule
  \hspace{0.03\textwidth}
  \begin{minipage}[t]{.33\textwidth}
    \vspace{0.1in}
    \begin{center}
      \textbf{Contact info.}
    \end{center}
    \footnotesize
    \email{appetrosyan@icloud.com}
    
    \phone{44}{7864}{647998}

    \phone{374}{96}{240350}

    \address{Dro~st.~\nth{4} bld.}{apt.52}{0069} {Yerevan}{Armenia}
  \end{minipage}
  \normalsize
}