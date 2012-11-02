/*!
 * SaaS I WordPress theme. IE7 hacks
 *
 * @category    SaaSI_Theme
 * @package     js
 * @copyright   Copyright (c) 2010 Worry Free Labs, LLC. (http://worryfreelabs.com/)
 * @author      Oleksandr Bernatskyi
 */

;jQuery
(
	function($)
	{
		/**
		 * Pricing Grid
		 */
		$('div.grid section footer li').hover
		(
			function()
			{
				$(this).css('z-index', 10000);
			},
			function()
			{
				$(this).css('z-index', 'auto');
			}
		);
	}
);