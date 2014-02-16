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

    $ make pdf

Hit the link to [preview the generated pdf](https://github.com/barraq/pandoc-moderncv/raw/gh-pages/preview/cv.pdf) 

There you are!

## Screenshots

| ![Pandoc-ModernCV large-screen preview ](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/large-screen.png) |
| :----: |
| **Screenshot of the scaffold CV taken for a large screen.**  |
| See also [medium-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/medium-screen.png) or [small-screen preview](https://raw.github.com/barraq/pandoc-moderncv/gh-pages/media/images/small-screen.png)


## Themes

Currently pandoc-moderncv supports a single theme: classic.

Feel free to contribute and send me your custom theme!

## Customization

All themes can be customized through SCSS variables defined in *stylesheets/_settings.scss*. Currently the variables are:

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

