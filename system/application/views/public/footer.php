    <div id="footer">
        <?php
        echo "<p>".$this->preference->item('company_name').", ".$this->preference->item('company_address').", ".
                $this->preference->item('company_post')." ".$this->preference->item('company_city').
                ", ".$this->preference->item('company_country')."<span id='phone'>".
                $this->preference->item('company_telephone')."</span><span id='mobile'>".$this->preference->item('company_mobile')."</span>".
                $this->preference->item('company_orgainzation_number')."<span id='webcom'>".$this->preference->item('company_other_one')."</span></p>";
                
                
         ?>       
    </div> 
</div>
<?php print $this->bep_assets->get_footer_assets();?>
</body>
</html>