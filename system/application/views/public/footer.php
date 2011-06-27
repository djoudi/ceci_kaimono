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
<?php print $this->bep_assets->get_footer_assets();?>
</body>
</html>