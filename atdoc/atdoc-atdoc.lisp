;;; ----------------------------------------------------------------------------
;;; atdoc-doc.lisp
;;;
;;; Documentation strings for the library atdoc.
;;;
;;; Copyright (C) 2012 Dieter Kaiser
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining
;;; a copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included
;;; in all copies or substantial portions of the Software.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
;;; OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
;;; OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
;;; ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;;; OTHER DEALINGS IN THE SOFTWARE.
;;; ----------------------------------------------------------------------------

(in-package :atdoc)

(setf (documentation (find-package :atdoc) t)
 "This is the documentation of a fork of the package
  @a[http://www.lichteblau.com/atdoc/]{@em{ATDOC}} which generates documentation
  for Common Lisp packages.  @em{ATDOC} extracts documention strings written
  using a custom markup language and generates HTML pages.  At this time the
  fork of  @em{ATDOC} does not allow to generate TeX documents, and Info files.
  The original package @em{ATDOC} was written by David Lichteblau and is
  available under an X11-style license.

  This fork of @em{ATDOC} extends the possibilities for formating and extracting
  informations about the package, which has to be documented.
  @begin[Overview]{section}
    @subheading{Author}
    Copyright (C) 2006, 2007, 2008 David Lichteblau@br{}
    Copyright (C) 2012 Dieter Kaiser

    @subheading{Version}
    This is a documentation of a fork of @em{atdoc} from February 22, 2012.

    @subheading{Homepage}
    See @a[http://www.lichteblau.com/atdoc/]{http://www.lichteblau.com/atdoc/}
    for the orginal version and
    @a[http://www.crategus.com/books/atdoc/index.html]{@em{ATDOC}} for this fork.

    @subheading{Mailing List}
    No mailing list.

    @subheading{Download and Installation}
    Download an
    @a[http://www.lichteblau.com/atdoc/download/]{@em{atdoc} tarball},
    or get it from
    git: http://www.lichteblau.com/git/atdoc.git
    (@a[http://www.lichteblau.com/git/?p=atdoc.git;a=summary]{gitweb})

    ASDF is used for compilation. Register the @code{.asd} file, e. g. by
    symlinking it,
    then compile @em{atdoc} using @code{asdf:load-system}.
    @begin{pre}
  $ ln -sf `pwd`/atdoc.asd /path/to/your/registry/
  * (asdf:load-system :atdoc)
    @end{pre}
    @subheading{Source Code}
    The source code is available from
    git: http://www.lichteblau.com/git/atdoc.git
    (@a[http://www.lichteblau.com/git/?p=atdoc.git;a=summary]{gitweb})

    @subheading{Dependencies}
    @em{atdoc} needs Closure XML, Split sequence, Slime's swank, Xuriella XSLT,
    @a[http://www.crategus.com/books/closer-mop/pages/closer-mop.html]{Closer-MOP},
    and their dependencies.
  @end{section}
  @begin[Output formats]{section}
    @em{atdoc} can currently generate documentation in these formats:
    @begin{itemize}
      @item{HTML, one page for each definition, with extra pages containing the
        package and overview text for its definitions 
        (@a[http://www.lichteblau.com/atdoc/example/multi-page/index.html]{example})}
      @item{HTML, all on one page 
        (@a[http://www.lichteblau.com/atdoc/example/single-page/index.html]{example})}
      @item{TeX documents, and}
      @item{Info files.}
    @end{itemize}
  @end{section}
  @begin[Sample Documentation]{section}
    As an example, code from the book Lisp (3rd edition) by Winston and Horn is
    chosen. You can find the code with an ASDF definition in the example/
    subdirectory of the @em{atdoc} sources so that you can easily compile it
    yourself. The code included is the Blocks World, from chapters 21 (\"The
    Blocks World with Classes and Methods\") and 22 (\"Answering Questions about
    Goals\"). Note that the source code from the book has been taken from the
    publically available lisp3 tarball and is covered by its own license,
    different from the license of @em{atdoc}.

    The examples linked above were generated using:
    @begin{pre}
  (atdoc:generate-html-documentation
     '(:blocks-world :blocks-world-goals)
     output-directory
     :index-title \"Blocks World API reference\"
     :heading \"The Blocks World\"
     :single-page-p t      ;optional
     :include-internal-symbols-p nil)
    @end{pre}
    and
    @begin{pre}
  (atdoc:generate-latex-documentation
     '(:blocks-world :blocks-world-goals)
     output-directory
     :title \"The Blocks World\")

  (atdoc:generate-info-documentation
     '(:blocks-world :blocks-world-goals)
     output-directory
     :name \"blocks-world\"
     :title \"The Blocks World\")
    @end{pre}
  @end{section}
  @begin[Writing a documentation string]{section}
    Here is an example of what the documentation of the Lisp function
    @a[http://www.lispworks.com/documentation/HyperSpec/Body/f_pr_obj.htm]{print-object}
    could look like using @em{atdoc}:
    @begin{pre}
  @@argument[object]{an object@}
  @@argument[stream]{a @@class{stream@}@}
  @@return{@@code{object@}@}

  @@short{The generic function @@fun{print-object@} writes the printed
  representation of @@code{object@} to @@code{stream@}.@}

  The function print-object is called by the Lisp printer; it should not
  be called by the user.

  (...)

  @@see{pprint-fill@}
  @@see{pprint-logical-block@}
  (...)
    @end{pre}
    Note that parts of the documentation strings are just documentation text,
    which will be included in a section \"Details\" of the page. Other parts,
    however, are not part of the actual text, and will be extracted from the
    documentation string as the first step of processing it. In this case,
    @code{@@arg}, @code{@@return}, and @code{@@see} are the tags that will be
    removed. All @code{@@arg} tags will be collected into a section about the
    function's arguments, all @code{@@see} tags will be collected together will
    all @code{@@fun} and @code{@@class} references into a \"See also\" section.

    @b{Tags for use only in the docstring of a package itself}
    @begin{table}
      @entry[@section[title@]{body}]{Generates a sub-heading called
        @code{title} with @code{body} as the content. A table of contents will
        be generated at the top of the package pages listing the sections.}
      @entry[@aboutfun{name}]{Insert the lambda list of function @code{name} and
        its short description which is the contents of @code{@@short} in its
        docstring.}
      @entry[@aboutmacro{name}]{Insert the lambda list of macro @code{name} and
        its short description which is the contents of @code{@@short} in its
        docstring.}
      @entry[@aboutclass{name}]{Insert the name of class @code{name} and its
        short description which is the contents of @code{@@short} in its
        docstring.}
      @entry[@abouttype{name}]{Insert the name of type @code{name} and its
        short description which is the contents of @code{@@short} in its
        docstring.}
    @end{table}
    @b{Tags that will be extracted into their own sections}
    @begin{table}
      @entry[@argument[name@]{description}]{Will be moved into the \"Arguments\"
        section.}
      @entry[@return{description}]{Will be moved into the \"Return Value\"
        section.}
      @entry[@see{name}]{Link to the function named name. Syntactically like
      @code{@@fun}, this tag will be moved into the \"See also\" section.}
      @entry[@see-slot{name}]{Similar to @code{@@see}, this tag specifies a slot
      reader function for the class it is used in, and will be moved into a
      \"Slot Access Functions\" sections. In addition, a section \"Inherited
      Slot Access Functions\" will be shown for subclasses.}
      @entry[@see-constructor{name}]{Similar to @code{@@see}, this tag specifies
        a function creating instances of current class, and will be moved into a
        \"Returned By\" section.}
    @end{table}
    @b{Tags for use in the documentation text}
    @begin{table}
      @entry[@short{text}]{Copies text into the output normally, but will also
        extract it for use with @code{@@aboutfun}, @code{@@aboutclass} ... }
      @entry[@code{text}]{In-line Lisp code @code{text}, will be formatted using
        a fixed-width font.}
      @entry[@a[href=\"URL\"@]{name}]{Hyperlink. This tag accepts an argument,
        the URL to be used as the href attribute.}
      @entry[@itemize, @item]{An unordered list like <ul> and <li>}
      @entry[@enumerate, @item]{An ordered list like <ol> and >li>}
      @entry[@table, @entry]{A definition list like <dl>, <dt>, <dd>}
      @entry[@fun{name}]{Link to the function named name, read as a symbol into
        the current package (qualify with a package name to reference other
        packages included in the same documentation).}
      @entry[@class{name}]{Link to the class named name. Works like
        @code{@@fun}.}
      @entry[@variable{name}]{Link to the special variable named name. Works
        like @code{@@fun}.}
    @end{table}
    @b{Tags that are passed through to HTML}
    @begin{table}
      @entry[@pre{text}]{Preformatted section, e.g. for source code listings.}
      @entry[@b{text}]{Bold font.}
      @entry[@em{text}]{Italic font.}
      @entry[@br{}]{A single line break.}
      @entry[@break{}]{Two line breaks.}
    @end{table}
  @end{section}
  @begin[The At-sign syntax]{section}
    @em{atdoc} looks for markup tags start with an at-sign @@, in either a long
    or a short form.  The short form looks like this:
    @begin{pre}
  @@return{the computed result@}
    @end{pre}
    The long form can be convenient for multiple lines of text:
    @begin{pre}
  @@begin{return@}
  the computed result
  @@end{return@}
    @end{pre}
    Except for the additional whitespace due to line breaks in the second
    example, the two forms are completely interchangeable. Behind the scenes,
    both produce an XML element with tag name result,
    @code{<result>the computed result</result>}.

    Both forms take an optional argument, written with brackets. To pass a
    hyperlink use the form:
    @begin{pre}
  @@a[http://www.cliki.net]{Cliki@}
    @end{pre}
    This form gets translated into
    @code{<a a=\"http://www.cliki.net\">Cliki</a>}, until the
    XSLT stylesheets rename a into href.
    
    A second example is
    @begin{pre}
  @@begin[Title]{section@}
  body
  @@end{section@}
    @end{pre}
    which gets translated into @code{<section section=\"Title\">body</section>}.

    The at-sign also escapes special characters. E. g. closing braces need to be
    escaped with the at-sign like @code{{n,m@@@}}.

    Multiple line breaks delimit paragraphs:
    @begin{pre}
  First paragraph.

  Second paragraph.
    @end{pre}
  @end{section}
  @begin[Generating formatted documentation]{section}
    Separate functions are offered for each output format:
    HTML pages, LaTeX/PDF output, and .info files.  There is also an
    older function called generate-documentation, which in now an
    alias for generate-html-documentation.

    @aboutfun{generate-html-documentation}
    @aboutfun{generate-latex-documentation}
    @aboutfun{generate-info-documentation}
    @aboutfun{generate-documentation}
    @end{section}

    @begin[Generating unformatted XML]{section}
    Power users might want to extract docstrings into XML and then
    send that XML through their own XSLT stylesheets.  The following
    function can be used for that purpose.

    @aboutfun{extract-documentation}
  @end{section}
")

(setf (documentation 'extract-documentation 'function)
 "@argument[packages]{List of package designators.
    Documentation will be generated for these packages.}
  @argument[directory]{A pathname specifying a directory.
    The output file will be written to this directory, which must already
    exist.}
  @argument[include-slot-definitions-p]{A boolean.}
  @argument[keys]{Extra parameters for stylesheets.}
  @begin{short}
    Extracts docstrings from @arg{packages} and writes them in XML syntax
    to the file @file{.atdoc.xml} in the specified directory.
  @end{short}

  With @arg{include-slot-definitions-p}, class documentation will include
  a list of direct slots.

  Extra parameters will be inserted as attributes on the root element.")

(setf (documentation 'generate-html-documentation 'function)
 "A deprecated alias for @fun{generate-html-documentation}.
  @see-function{generate-html-documentation}")

(setf (documentation 'generate-html-documentation 'function)
 "@argument[packages]{List of package designators.
    Documentation will be generated for these packages.}
  @argument[directory]{A pathname specifying a directory.
    All output files and temporary data will be written
    to this directory, which must already exist.}
  @argument[author]{}
  @argument[author-url]{}
  @argument[date]{}
  @argument[index-title]{This string will be
     used as the title of the main page, index.html.
     (Other pages will be named according to the object they are
     documenting.)}
  @argument[heading]{This string will be used as a visible title on top of
     every page.}
   @argument[logo]{Deprecated.}
   @argument[css]{A pathname or string pointing to a cascading stylesheet (CSS)
     file. This file will be copied to the target directory under the name
     index.css. If this argument is a string and does not start with a dot, it
     will be taken as namestring relative to the atdoc/css  directory.}
   @argument[single-page-p]{A boolean.}
   @argument[include-slot-definitions-p]{A boolean.}
   @argument[include-internal-symbols-p]{A boolean.}
   @return{The pathname of the generated file index.xml.}
   Generates HTML documentation for @code{packages}.

   With @code{single-page-p}, all documentation is assembled as a single
   page called index.html.  Otherwise, index.html will include only
   a symbol index and a summary of each package, with links to other pages.

   With include-slot-definitions-p, pages for symbols that are not exported
   will be included, so that documentation for exported symbols can safely
   refer to internal pages (but internal symbols will not be included in
   the symbol index automatically).  This option has no effect if
   single-page-p is enabled.

   With @code{include-slot-definition}, class documentation will include
   a list of direct slots.")

(setf (documentation 'generate-latex-documentation 'function)
 "@argument[packages]{List of package designators.
     Documentation will be generated for these packages.}
  @argument[directory]{A pathname specifying a directory.
     All output files and temporary data will be written
     to this directory, which must already exist.}
  @argument[title]{This string will be used as the document's title.}
  @argument[include-slot-definitions-p]{A boolean.}
  @argument[run-tex-p]{A boolean.}
  @return{The pathname of the generated file documentation.pdf, or nil.}
   Generates TeX documentation for @code{packages}.

  With @arg{run-tex-p} (the default), pdflatex is run automatically to
  generate a PDF file.

  With @arg{include-slot-definition-p}, class documentation will include
  a list of direct slots.")

(setf (documentation 'generate-info-documentation 'function)
 "@argument[packages]{List of package designators.
    Documentation will be generated for these packages.}
  @argument[directory]{A pathname specifying a directory.
    All output files and temporary data will be written
    to this directory, which must already exist.}
  @argument[title]{This string will be used as the document's title.}
  @argument[include-slot-definitions-p]{A boolean.}
  @return{The pathname of the generated file documentation @file{.pdf}, or
   @sym{nil}.}
  @short{Generates Info documentation for @arg{packages}.}

  With @arg{run-tex-p} (the default), pdflatex is run automatically to
  generate a PDF file.

  With @arg{include-slot-definition-p}, class documentation will include
  a list of direct slots.")

;;; --- End of file atdoc-doc.lisp ---------------------------------------------
