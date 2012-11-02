/*!
 * Twitter Gridder
 *
 * @category    WorryFreeLabs
 * @package     Twitter Gridder
 * @copyright   Copyright (c) 2010 Worry Free Labs, LLC. (http://worryfreelabs.com/)
 * @author      Oleksandr Bernatskyi
 */
;jQuery(document).ready
(
	function()
	{
		/**
		 * Initialization
		 */
		var $gridder = jQuery('div.gridder');
		
		if ($gridder.length)
		{
			jQuery('li', $gridder).hover
			(
				function()
				{
					jQuery(this).find('div.twitter').toggle();
				}
			);
		}
	}
);