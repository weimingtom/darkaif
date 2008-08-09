<?php
#==================================================================================================
#Home Page Index
#==================================================================================================
function page($type){
if (strlen(strstr($_SERVER['REQUEST_URI'], 'scripts')) > 1) {
	require('../config.php');
#	echo "[-scripts folder-]";
}else{
	//require('scripts/config.php');
	require('config.php');
#	echo "[-localhost-]";
}
#echo 'sdfsdf';
$pagetype = 'news';
$pagemessage  = '';
$pagemessage_number = '';
//POSTING
$posting_count = 0;               //Post Counter
$posting_pagestart = 0;
$posting_pageend = 0;
$nodisplyposting = 4;             //Display max posting

$nopostings = 0;                  //number of posting in total

//INDEX PAGE
$pagesindex = 0;                  //Current Index
$pagesindexmax = 0;               //Max number of pages
$pagesindexlimit = 3;             //Display max number of index;

#$current_url = 'index.php?index=home';
$current_url = '?home=news';

#==================================================================================================
# Read More Info. For Message that has been posted.
#==================================================================================================
if ($_GET['read'] != null){
   $ID_Post = $_GET['read'];
   //=================================================================================================
   // DATABASE
   //=================================================================================================
   mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_posting = $prefix."page";
   $query = "SELECT * FROM $db_posting WHERE id='$ID_Post'";
   $result = mysql_query($query)or die(mysql_error());
   $row = mysql_fetch_array($result);
   $pagemessage .= '<ul> ';
   $pagemessage .= '<li style="background:#363430;">['.$row['category'].'] Title:'.$row['title'].'</li>';
   $pagemessage .= '<li style="height:128;overflow:auto;">'.$row['body'].'</li>';
   $pagemessage .= '<li style="background:#363430;">Posted By:'.$row['username'].'<br>Date:'.$row['date'].'</li>';
   $pagemessage .= '</ul>';
}
else
{
      //=================================================================================================
      // CONNECT DATABASE
      //=================================================================================================
      mysql_connect($host,$user,$pass) or die(mysql_error());
mysql_select_db($database) or die(mysql_error());

$db_posting = $prefix."page";
      $pagemessage .= '<ul id="newspage">';
      //=================================================================================================
      //POSTING DATABASE
      //=================================================================================================
      //$query = "SELECT * FROM $db_posting";
      $query = "SELECT * FROM $db_posting WHERE category='$pagetype' ORDER BY id DESC";
      $result = mysql_query($query)or die(mysql_error());
	  $pagemessage .= '<li style="background:#22201D;">News</li>';
      $nopostings = mysql_num_rows($result);                                                                //Number of pages

      if ($_GET['pages'] == null){
         $current_pageindex = 1;                                                                            //Page index
      }else{
            $current_pageindex = $_GET['pages'];                                                            //Current Page Index
      }
      $posting_pagestart = ($current_pageindex*$nodisplyposting)-$nodisplyposting + 1;                      //Display Start Posting
      $posting_pageend = ($current_pageindex*$nodisplyposting) + 1;                                         //Display End Posting

      while ($row = mysql_fetch_array($result)){                                                            //OUTPUT
            $posting_count = $posting_count + 1;
            if (($posting_count >= $posting_pagestart) and ($posting_count < $posting_pageend)){            //Display posting in range
               $pagemessage .= '<li><a  href='.$current_url.'&read='.$row['id'].'>'.$row['title'].'</a></li>';
            }
      }
      $pagemessage .= '</li>';
      $pagemessage .= '</ul>';
      //count number current posting in the database
//===============================================================================================//
//Page Number
//===============================================================================================//
      //how many pages per post display
      $pagesindexmax = round(($nopostings/$nodisplyposting),0);                                //Pages Index
      if (($nopostings/$nodisplyposting) > round(($nopostings/$nodisplyposting),0)){           //IF Page Index need an extra page to add
         $pagesindexmax = $pagesindexmax + 1;
      }
      if ($current_pageindex != 1 ){                                                           //If first index do not show the first index
         $pagemessage_number .= '<a class="pagenumber" href='.$current_url.'&pages=1>'.'First'.'</a>';
      }
      //DO WHILE LOOP
      do{
         $pagesindex = $pagesindex + 1;                                                        //counter add index
         if (($pagesindex >=  (($current_pageindex-$pagesindexlimit)))and($pagesindex <=  (($current_pageindex+$pagesindexlimit)))){
            if ($pagesindex == $current_pageindex){
               $pagemessage_number .= '<label class="pagenumber">'.$current_pageindex.'</label>';
            }else{
                  $pagemessage_number .= '<a class="pagenumber" href='.$current_url.'&pages='.$pagesindex.'>'.''.$pagesindex.'</a> </li>';#.$pagesindex.'|'.($current_pageindex*$pagesindexlimit);
            }
         }
      }while($pagesindex < $pagesindexmax);
      $pagemessage_number .= '<a class="pagenumber" href='.$current_url.'&pages='.$pagesindexmax.'>'.'Last '.'</a>';
}//End Read
#echo $pagemessage;
if ($type == 'news'){
   return $pagemessage;
}elseif ($type == 'number'){
        return $pagemessage_number;
}
}
?>