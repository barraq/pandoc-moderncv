**Pandoc-ModernCV** provides Pandoc fa­cil­i­ties for type­set­ting modern **cur­ricu­lums vi­tae in markdown**. Inspired by the well known Latex ModernCV, it is fairly cus­tomiz­able, al­low­ing you to use predefined themes and to define your own style by changing colors, fonts, etc.

> With **Pandoc-ModernCV** simply **write your CV in Markdown**, compile it and publish it in a snap!

Pandoc-ModernCV currently supports **pdf** and **html5** export formats. The html5 output is responsive and supports rendering for small to large screens.

## Features

> Writing a CV has never been so simple!

- write your CV in Markdown
- choose between themes
- customize your style
- export to HTML5
    + responsive layout (mobile, tablet, desktop)
    + print layout
- export to PDF
    + A4 format ready
    + PDF tags (title, author, etc.)
- publish public & private CV

## Preview & Screenshots

### HTML5

Live **html5** preview [here](http://barraq.github.io/pandoc-moderncv/preview/cv.html) 

| ![Pandoc-ModernCV large-screen preview ](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/large-screen.png) |
| :----: |
| **Screenshot of the HTML scaffold CV taken for a large screen.**  |
| See also [medium-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/medium-screen.png) or [small-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/small-screen.png) |

### PDF

Live **pdf** preview [here](http://barraq.github.io/pandoc-moderncv/preview/cv.pdf) 

| ![Pandoc-ModernCV PDF export preview ](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/cv-pdf.png) |
| :----: |
| **Screenshot of the PDF scaffold CV.** Notice the QR-Code  |

## Requirements

For building your CV in html you need:
- [Compass](http://compass-style.org/) (>= 1.0), 
- [Susy](http://susy.oddbird.net/) (>= 2.1),
- [RSync](http://rsync.samba.org/),
- [Pandoc](http://johnmacfarlane.net/pandoc/) (>= 1.13)

For exporting your CV to pdf you need:
- wkpdf or wkhtmltopdf:
    - wkpdf (MacOS X), http://plessl.github.io/wkpdf/
    - wkhtmltopdf (Linux, Windows), http://wkhtmltopdf.org/
- exiftool, http://www.sno.phy.queensu.ca/~phil/exiftool/

## Installation

Install **Compass** and **Susy**:
    
    $ gem install compass
    $ gem install susy

Install **wkpdf** or **wkhtmltopdf**. If on MacOSX please check Troubleshooting section for installing correctly wkpdf.

Install **Pandoc** by using your package manager or by using the provided installer http://johnmacfarlane.net/pandoc/installing.html (or using *cabal*)

Install **exiftool** by using your package manager (use [brew](http://brew.sh/) on Mac)

**rsync** should already be installed... if not, install it using your package manager.

You are done!

### Docker all in one

See the [Windows](#on-windows) section if you want to run the image on windows.

If you prefer not to install the dependencies on your local machine, 
you can build and run a docker image (assuming you have 
[docker installed](https://docs.docker.com/get-docker/)).

Build the image: 

```console
make image
```

Then run the image with the required targets (see below):

```console
docker run -v $(pwd):/work -it pandoc-moderncv:latest make html pdf
```

#### On Windows

All commands have been tried in Powershell. With cmd or git bash you might run into problems. The make command will not work on Windows. Thus, you have to run the command to build the image directly.

Assuming you have [docker installed](https://docs.docker.com/get-docker/), run the following command in the repos folder:

```console
docker build -t pandoc-moderncv:latest .
```

Then run the image with the required targets (see below):

```console
docker run -v ${pwd}:/work -it pandoc-moderncv:latest make html pdf
```

## Getting Started

The simplest way to get started with *pandoc-moderncv* is to use the provided scaffold. In a terminal just do:

    $ make scaffold
    $ make html

What it does it that it creates a scaffold *cv* located in the /cv directory and builds an html version of it. To open the generated cv just do:

    $ open dist/cv.html

To export the CV to pdf just do:

    on MacOS X
    $ make pdf

    on Linux/Windows
    $ make pdf HTMLTOPDF=wkhtmltopdf

Hit the link to [preview the generated pdf](https://github.com/barraq/pandoc-moderncv/raw/gh-pages/preview/cv.pdf) 

There you are!

## Customize

### Metadata

Your CV can be customized with metadata. Metadata are located between two --- separators at the top of the cv.md file and are formated using the YAML format:

    ---
    lang: en
    title: Résumé Title
    firstname: Firstname
    lastname: Lastname
    photo: images/picture.png
    email: contact@yoursite.com
    mobile: '+1 (234) 567 890'
    address:
      city: City 
      country: Country
    settings:
      protect-mobile: true
      protect-email: true
    ---

    put here your *CV* data

Currently Pandoc-MordernCV supports the following metadata:

| key                     |  type    | value                          |
| :---------------------- | :------: | :----------------------------- |
| lang                    | string   | en                             |
| title                   | string   | Résumé Title                   |
| firstname               | string   | Firstname                      |
| lastname                | string   | Lastname                       |
| photo                   | url      | path/to/photo.png              |
| qrcode                  | url      | images/qrcode.png              |
| contact                 | url      | http://contact.yoursite.com    |
| homepage                | url      |  http://yoursite.com           |
| email                   | email    | contact@yoursite.com           |
| mobile                  | string   | '+1 (234) 567 890'             |
| phone                   | string   | '+2 (345) 678 901'             |
| fax                     | string   | '+3 (456) 789 012'             |
| footer                  | markdown | **custom** *markdown* text     |
| **address**             | map      |                                |
|   city                  | string   | City                           |
|   country               | string   | Country                        |
| **settings**            | map      |                                |
| protect-email           | boolean  | true/false (default: false)    |
| protect-mobile          | boolean  | true/false (default: false)    |
| protect-phone           | boolean  | true/false (default: false)    |
| protect-fax             | boolean  | true/false (default: false)    |
| protect-address         | boolean  | true/false (default: false)    |
| display-lastupdate      | boolean  | true/false (default: false)    |

### Private & Public CV

It is often handy to hide/show specific informations in your CV depending on where it is published/sent. Pandoc-ModernCV supports **public** and **private** cv:
* when **public**:
    - protected metadata are removed.
    - *cv/public.md* is displayed just after the header and before the CV body.
* when **private**:
    - protected metadata are displayed.
    - *cv/private.md* is displayed just after the header and before the CV body.

#### Protecting Metadata

Currently Pandoc-ModernCV can protect the following metadata:
* email
* mobile
* phone
* fax
* address

Metadata can be (un)protected independently as follow:

    ---
    ...
    settings:
      protect-mobile: true # this protect *mobile*
      protect-email: false # this unprotect *email*
    ---


#### Building Private/Public CV

To build a public CV just do:

    $ make html public-cv=true
    or
    $ make pdf public-cv=true

To build a private CV just do:

    $ make html private-cv=true
    or
    $ make pdf private-cv=true

### Themes

Currently pandoc-moderncv supports a single theme: classic.

> Feel free to contribute and send me your custom theme!

### Colors, Fonts, Icons

All themes can be customized through variables defined in *stylesheets/_settings.scss*. Currently the variables are:

    $base-font-size: 18px;
    $base-line-height: 23px;

    $photo-width: 182px;
    $qrcode-width: 100px;

    // Size
    $h1-font-size:      $base-font-size*2;
    $h1-line-multiple:  2;
    $h2-font-size:      $base-font-size*1.5;
    $h2-line-multiple:  1.5;
    $h3-font-size:      $base-font-size*1.2;
    $h3-line-multiple:  1;

    // Colors
    $firstname-color: rgb(0, 0, 0);
    $familyname-color: rgb(0, 0, 0);
    $title-color: rgb(89, 89, 89);
    $address-color: rgb(0, 0, 0);
    $quote-color: rgb(0, 0, 0);
    $section-rectangle-color: rgb(191, 191, 191);
    $section-title-color: rgb(89, 89, 89);
    $subsection-color: rgb(0, 0, 0);
    $hint-color: rgb(0, 0, 0);

    // Icons
    $external-link-icon: $fa-var-external-link;
    $email-icon: $fa-var-envelope-o;
    $phone-icon: $fa-var-phone;
    $mobile-icon: $fa-var-mobile;
    $fax-icon: $fa-var-print;

## Troubleshooting

#### Cannot load such file -- sass/script/node (LoadError)

For some reasons there is a bug when installing the latest version of Compass... your install of Sass get messed up (I didn't have time to investigate: if you have a better workaround/explanation let me know). 

To get over it just uninstall sass and install it again:

    $ gem uninstall sass
    $ gem install sass

#### Cannot load RubyCocoa library

When trying to install wkpdf on MacOsx you may be told that *wkpdf requires that RubyCocoa is installed...* The fact is that using wkpdf with non-default Ruby installations is not supported.

You must install wkpdf with the native ruby packaged on your mac:
- https://github.com/plessl/wkpdf/issues/36
- https://github.com/sstephenson/rbenv/issues/270

You can use *rvm* or simply do:

    $ sudo /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/gem install wkpdf

To check if your install is correct be sure that the first line of */usr/bin/wkpdf* file looks like the following:

    #!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
