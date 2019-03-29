# Thanks to https://github.com/simonwhitaker/github-fork-ribbon-css

module BasicAuthMark
  class Mark
    def initialize
    end

    def insert_into(html)
      position = BasicAuthMark.position

      style_tag_str = <<-EOS
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-fork-ribbon-css/0.2.2/gh-fork-ribbon.min.css" />
      EOS

      div_tag_str = <<-EOS
<div class="github-fork-ribbon #{position}" onClick="this.style.display='none'" data-ribbon="BASIC AUTH"></div>
      EOS

      html
        .sub(%r{(</head>)}i, "#{style_tag_str.strip}\\1")
        .sub(%r{(<body[^>]*>)}i, "\\1#{div_tag_str.strip}")
    end
  end
end
