    <div id="footer">
        <?php
        echo "<div id='footmain'>".$this->preference->item('company_name').", ".$this->preference->item('company_address').", ".
                $this->preference->item('company_post')." ".$this->preference->item('company_city').
                ", ".$this->preference->item('company_country')."<span class='phone'>Ph. ".
                $this->preference->item('company_telephone')."</span><span class='phone'>Mobile ".$this->preference->item('company_mobile')."</span><span id='orgnum'>Org. no.".
                $this->preference->item('company_organization_number')."</span><span id='webcom'>".$this->preference->item('company_other_one')."</span></div>";
                
                
         ?>       
    </div> 
</div>
<!-- sharethis buttons -->
<?php

if ($this->preference->item('sharethis_pub_key')){
    $this->load->helper('sharethis');
    echo '<div id="sthoverbuttons" class="sthoverbuttons-pos-left">';
    echo sharethis();
    echo "</div>";
}

?>
<!-- end of sharethis -->
<?php print $this->bep_assets->get_footer_assets();?>
<?php if ($this->preference->item('ga_tracking')): ?>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', '<?php echo $this->preference->item('ga_tracking');?>']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);
  })();

</script>

<?php endif; ?>
</body>
</html>