pandoc-moderncv
===============

**Pandoc-ModernCV** is a Pandoc fa­cil­i­ties for type­set­ting mod­ern cur­ricu­lums vi­tae. Inspired by the well known Latex ModernCV, it is fairly cus­tomiz­able, al­low­ing you to use predefined themes and to define your own style by changing colors, fonts, etc.

Pandoc-ModernCV currently supports *pdf* and *html5* export formats. The html5 output is responsive and supports rendering for small to large screens.

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

## Screenshots

| ![Pandoc-ModernCV large-screen preview ](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/large-screen.png) |
| :----: |
| **Screenshot of the scaffold CV taken for a large screen.**  |
| See also [medium-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/medium-screen.png) or [small-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/small-screen.png)

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
      - private-mobile: true
      - private-email: true
    ---

    put here your *CV* data

Currently Pandoc-MordernCV supports the following metadata:

| key                     |  type    | value                          |
| ----------------------- | :------: | ------------------------------ |
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
| **settings**            | list     |                                |
| private-email           | boolean  | true/false (default: false)    |
| private-mobile          | boolean  | true/false (default: false)    |
| private-phone           | boolean  | true/false (default: false)    |
| private-fax             | boolean  | true/false (default: false)    |

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

Metadata can be (un)protected independently as follow:

    ---
    ...
    settings:
      - private-mobile: true # this protect *mobile*
      - private-email: false # this unprotect *email*
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

## Requirements

For building your CV in html you need:

* Compass, http://compass-style.org/
* Pandoc, http://johnmacfarlane.net/pandoc/

For exporting your CV to pdf you need one of those:
* wkpdf (MacOS X), http://plessl.github.io/wkpdf/
* wkhtmltopdf (Linux, Windows), http://wkhtmltopdf.org/
