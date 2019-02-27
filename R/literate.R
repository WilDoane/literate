# Inspired by Donald Knuth's Literate Programming and Edward Tufte's print format style

# https://www-cs-faculty.stanford.edu/~knuth/lp.html
# "Literate programming is a methodology that combines a programming language
# with a documentation language, thereby making programs more robust, more
# portable, more easily maintained, and arguably more fun to write than programs
# that are written only in a high-level language. The main idea is to treat a
# program as a piece of literature, addressed to human beings rather than to a
# computer. The program is also viewed as a hypertext document, rather like the
# World Wide Web. (Indeed, I used the word WEB for this purpose long before CERN
# grabbed it!) This book is an anthology of essays including my early papers on
# related topics such as structured programming, as well as the article in The
# Computer Journal that launched Literate Programming itself. The articles have
# been revised, extended, and brought up to date."

# http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/tufte-latex/sample-handout.pdf


#' Literate (v. "litter ate")
#'
#' @return
#' @export
#'
#' @examples
literate <- function() {

  src <- rstudioapi::getSourceEditorContext()$contents

  filename_r <- tempfile()
  filename_md <- paste0(filename_r, ".md")
  filename_html <- paste0(filename_r, ".html")

  # Goal: ensure all lines have a trailing # clause

  # Case 1: lines with no #
  src <- sub("^([^#]*)$", "\\1#", src)

  # Case 2: lines with # only within quotation marks
  src <- sub("^(.*\".*\"[^#]*)$", "\\1#", src)

  # Format all lines as MD table
  src <- sub("^(.*)#([^#]*)$", "<code>\\1</code> | <span class=\"comments\">\\2</span>", src)

  # src <- sub("^[\t ]+\\|", "&nbsp; |", src)

  # Prepend custom CSS and MD table header
  src <- c("<style>
              table.table>tbody>tr>td, table.table>thead>tr>th {border: 0;}
              code {font-family: 'Fira Code', monospace; background-color:#ffffff;}
              .comments {font-family: cursive; color:#888888;}
            </style>",
           "&nbsp; | &nbsp;", # table header row
           "-- | --", src)

  writeLines(src, filename_md)

  rmarkdown::render(filename_md, "html_document", output_file = filename_html)

  # Now, in HTML, force lines that were ONLY a comment to span 2 columns
  src <- readLines(filename_html)

  emptys <- grep("<td><code></code></td>", src)

  src <- sub("^<td><code></code></td>", "", src)

  src[emptys + 1] <- sub("^<td>", "<td colspan=2>", src[emptys + 1])

  writeLines(src, filename_html)

  rstudioapi::viewer(filename_html)

}

