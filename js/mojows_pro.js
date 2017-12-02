<!--
  //
  // Mojo Webstats Pro Javascript
  //    made by Mesedilla Studios
  //
  // Visit http://mojowebstats.sourceforge.net for more information
  // Email mojowebstats@mesedilla.com for any assistance with this software
  //
  // (c) 2002-2003 Fritz Mesedilla [http://www.mesedilla.com]
  // ------------------------------------------------------------------
  // You can use this script for FREE but please keep this copyright notice.
  //

    //parses the title
    doc_title=(document.title)+"";
    if((doc_title=="undefined")||(doc_title==""))
    {
      doc_title="Untitled";
    }

    //parses the referrer
    doc_refer=escape(document.referrer)+"";
    if((doc_refer=="undefined")||(doc_refer==""))
    {
      doc_refer="Bookmark";
    }

    var width = screen.width;
    var res =(((!(640-width))*1)+((!(800-width))*2)+((!(1024-width))*3)+((!(1152-width))*4)+((!(1280-width))*5)+((!(1600-width))*6));

    if (!(res))
    {
      res = 1;
    }

    if (res=="1")
    {
      visitor_width = "640";
      visitor_height = "480";
    }

    if (res=="2")
    {
      visitor_width = "800";
      visitor_height = "600";
    }

    if (res=="3")
    {
      visitor_width = "1024";
      visitor_height = "768";
    }

    if (res=="4")
    {
      visitor_width = "1152";
      visitor_height = "864";
    }

    if (res=="5")
    {
      visitor_width = "1280";
      visitor_height = "1024";
    }

    if (res=="6")
    {
      visitor_width = "1600";
      visitor_height = "1200";
    }

    if (res!="1" && res!="2" && res!="3" && res!="4" && res!="5" && res!="6")
    {
      visitor_width = screen.width;
      visitor_height = screen.height;
    }

//alert("http://emkt.medselfed.net/webstats/mojows_pro.php?userId=" + userIp + "&width="+visitor_width+"&height="+visitor_height+"&doc_location="+location.pathname+location.search+"&doc_title="+doc_title+"&doc_refer="+doc_refer+"")
    //sends data
    document.write("<img src='http://emkt.medselfed.net/webstats/mojows_pro.php?userId=" + userIp + "&width="+visitor_width+"&height="+visitor_height+"&doc_location="+location.pathname+location.search+"&doc_title="+doc_title+"&doc_refer="+doc_refer+"' border=0 height=1 width=1>");
-->
