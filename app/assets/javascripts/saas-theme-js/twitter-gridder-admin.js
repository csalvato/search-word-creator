/*!
 * Twitter Gridder Admin
 *
 * @category    WorryFreeLabs
 * @package     Twitter Gridder
 * @copyright   Copyright (c) 2010 Worry Free Labs, LLC. (http://worryfreelabs.com/)
 * @author      Oleksandr Bernatskyi
 */
;$j = jQuery.noConflict();

$j(document).ready
(
	function()
	{
		var $gridderAccounts = $j('#gridder-accounts');
		
		/**
		 * Sortable accounts
		 */
		function sortableAccounts()
		{
			$gridderAccounts.sortable
			({
				placeholder: 'sortable'
			});
		}
		
		sortableAccounts();
		
		
		/**
		 * New gallery account
		 */
		$j('#add-new-account').click
		(
			function(event)
			{
				event.preventDefault();
				
				$j('#gridder-account-pattern').children()
					.clone()
					.hide()
					.appendTo($gridderAccounts)
					.fadeIn('normal');
				
				sortableAccounts();
			}
		);
		
		
		/**
		 * Delete Account
		 */
		$j('a.delete-account', $gridderAccounts).live
		(
			'click',
			function(event)
			{
				event.preventDefault();
				
				var $parent = $j(this).parent().addClass('deleteable');
				
				if (confirm('Are you sure you want to delete the selected account?'))
				{
					$parent.fadeOut
					(
						'normal',
						function()
						{
							$parent.remove();
						}
					);
				}
				else
				{
					$parent.removeClass('deleteable');
				}
			}
		);
	}
);