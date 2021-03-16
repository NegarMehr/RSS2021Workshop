# al-folio Jekyll - My notes

<input type="text" value="/Users/pdelgosha/Documents/Negar/Webpage/Jekyll/al-folio/My_notes/alfolio_my_notes.md" id="myInput" readonly>
<button onclick="myFunction()">Copy Source Location</button>
<script>
function myFunction() {
       var copyText = document.getElementById("myInput");
       copyText.select();
       document.execCommand("copy");
 } 
</script>

# How-to's

## How to add a new page to the navigator

Just add a file to `_pages_`, for instance `test.md`, which has the following header:

```
---
layout: page
permalink: /test/
title: test
description: 
nav: true
order: a
---
```

Note that `order` is a key that I have added and will be explained later. `title` is the text that shows both in the navigation bar as well as when you go to the page. 

## How to change the order of pages in the navigation bar

This is why I have added the order key. This is how it works: If you go to `_includes/header.html_`, this is the template for the header which includes the navigation bar. Search for the comment `<!-- Navbar Toogle -->` and you will find below it three blocks: it starts with `!<-- About -->`, and then there are `!<-- Other pages -->` and `!<-- Blog -->`. I brought Blog to the end, but apart from about and blog, the rest of the pages are sorted based on this: the first line in the other pages block looks like this (in the version I have modified): `{% assign sorted_pages = site.pages | sort: "order" %}`, this says that sort the remaining pages based on the `order` key, which is precisely what I have added to the key set of each page (you should manually add this key to all pages). Then, with this order key you can set the order. 

## Change the theme color

Look at the file `_sass/_variables.scss`, below the comment line which reads `set theme color`, I modified it to `$theme-color:         $green-color-dark;`, where you can replace the color with anything else.

## Change the color of the address block

Go to `_sass/_base.scss`, in the `.profile` section, in the `.address` block, you will find a `font-family` line, just change that. 

## Change page title sizes

By inspecting elements in chrome, and studying `_layouts/page.html`, I realized that the class is called `post-title`, which was not defined in `_sass/_base.scss`. So I realized that I can define it myself like this in `_sass/_base.scss`:

```
h1.post-title {
    font-size: 2rem;
}

h2.post-title{
    font-size: 1.5rem;
}
```

<font color='red'> Update: </font> For markdown, if you use `##`, it gets h2 but general h2 not `h2.post-title`, so I also had to add this:

```
h2{
    font-size:1.5rem;
}
```

## How to distinguish between conference and journal papers:

My `_pages/publications.md` looks like this:


```
<h2 class="post-title"> journal papers </h2> 

<div class="publications">

{% for y in page.years %}
  <!--- <h2 class="year">{{y}}</h2> --->
  {% bibliography -f papers -q @*[year={{y}},type=journal]*   %}
{% endfor %}

</div>


<h2 class="post-title"> conference papers </h2> 

<div class="publications">

{% for y in page.years %}
  <!--- <h2 class="year">{{y}}</h2> --->
  {% bibliography -f papers -q @*[year={{y}},type=conference]*   %}
{% endfor %}

</div>

```


 Note that for this, in the bib file that you create, for each bib item I have a type=journal or type=conference key based on which the above querying takes place. You need to do the same thing for conference. Next, I discuss how to remove sorting based on the year.

## In publications, how to remove the year?

In `_pages/publicagtions.md`,  it is originally like this:

```
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}},type=conference]*   %}

```
simply remove the h2 header which creates the year

## In publications, how to decrease the left space for each paper left for its tag

In `_layouts/bib.html`, after you find `<div class="col-sm-2 abbr">`. the `col-sm-2` is a standard class and the 2 in it means that it is a column with width 2 (don't know the unit). I simply changes it to `col-sm-1`. Also, in the line `  <div id="{{entry.key}}" class="col-sm-8">`, I changed `col-sm-8` to `col-sm-10` to make the titles wider. 


## Negar did not like her first name to be bold

In `_layouts/about.html`, the header looks like this:

```
    <h1 class="post-title">
     {% if site.title == blank %}{{ site.title }}{% else %}<span class="font-weight-bold">{{ site.first_name }}</span> {{ site.middle_name }}  {{ site.last_name }}{% endif %}
    </h1>
```

I simply removed `font-weight-bold`, and changed it to this:

```
    <h1 class="post-title">
     {% if site.title == blank %}{{ site.title }}{% else %}<span>{{ site.first_name }}</span> {{ site.middle_name }}  {{ site.last_name }}{% endif %}
    </h1>
```

## Changing arxiv and html button in bibliography size

In `_scss/_base.scss` file, in `ol.bibliography.links.a.btn`, line 363, I changed the `padding`, `font_size`, and `border_raduis` like this:

```
      .links {
          a.btn {
              // I changed here for html and arxiv buttons
          color: $text-color;
          border: 1px solid $text-color;
          padding-left: 0.4rem;
          padding-right: 0.4rem;
          padding-top: 0.25rem;
          padding-bottom: 0.25rem;
          font-size: 8pt;
          color: $theme-color;
          border-color: $theme-color;
          border-radius: 8pt;
          &:hover {
            color: $theme-color;
            border-color: $theme-color;
          }
        }
      }
```

Note that I have also changed the original color (without hover) so that we have more green elements.

## Chante social icons styles

In the file `_sass/_base.scss`, search for `.contact-icon`, to change the size, you can change `font-size`, the behavior after going over the icon is inside the hover section. You can change the color before hovering as well in the line above that. <font color='red'> CAUTION </font> There are multiple contact-icon sections, you should edit the one with a `Social (bottom)` comment above it.

## access the webpage from other computers in the network

Learnt from [here](https://zarino.co.uk/post/jekyll-local-network/), the magic is that initially to run Jekyll from command line, instead of saying `bundle exec jekyll serve`, use `bundle exec jekyll serve --host 0.0.0.0`.

## Text with color

To mark a text with lets say the theme color, I have the following part in the `sass/_base.scss_` file:

```
.keyword {
    color: $theme-color;
}
```

then, whenever you want to have a colored text, simply do this in html or markdown:

```
<span class="keyword"> test </span>
```

## Increasing the width of date column in news

I simply added this to `_sass/_base.scss`:

```
.news table th {
    min-width: 130px;
}
```

## Exlude this notes folder from being included in `_sites`

In `_config.yml`, I have `exclude: [vendor, notes]`.
