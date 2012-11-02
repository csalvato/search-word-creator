/*!
 * SaaS I WordPress theme
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
		 * Homepage
		 */
		if ($('body').is('.home'))
		{
			$('.controller:has(ul)')
				.tabs()
				.find('a:first')
					.addClass('first')
					.end()
				.find('a:last')
					.addClass('last');
		}
		
		// Features
		$('div.features li:nth-child(4n-3)').addClass('first');
		
		
		/**
		 * Submenu
		 */
		$('div.sidebar div.submenu ul')
			.find('li:first')
				.addClass('first')
				.end()
			.find('li:last')
				.addClass('last');
		
		
		/**
		 * Pricing Grid
		 */
	
		var $grid = $('div.grid');
		var $_div = $('div.grid > div');
		
		
		$grid
			.find('section:first')
				.addClass('first')
				.end()
			.find('section:last')
				.addClass('last')
				.end()
		   .height($_div.height());
		
		var $gridSections = $grid.find('section');
		
			
		$gridSections.hover
		(
			function()
			{
				$gridSections.removeClass('on');
				$(this).addClass('on');
			}
		);
	}
);