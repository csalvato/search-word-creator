/*!
 * Lowrider Slider Admin
 *
 * @category    WorryFreeLabs
 * @package     Lowrider Slider
 * @copyright   Copyright (c) 2010 Worry Free Labs, LLC. (http://worryfreelabs.com/)
 * @author      Oleksandr Bernatskyi
 */
;$j = jQuery.noConflict();

$j(document).ready
(
	function()
	{
		/**
		 * Initialize Gallery Images IDs
		 */
		$j('#gallery-images li, #gallery-slides li').each
		(
			function()
			{
				var $this = $j(this);
				$j('img', $this).attr('rel', $this.attr('rel'));
			}
		);
		
		
		/**
		 * Drag & Drop
		 */
		$j('#gallery-images img').draggable
		({
			revert: 'invalid',
			helper: 'clone',
			cursor: 'move'
		});
		
		function droppableGallery($droppable)
		{
			$droppable.droppable
			({
				accept: '#gallery-images img',
				activeClass: 'droppable',
				drop: function(event, ui)
				{
					var $this = $j(this);
					var $draggable = $j(ui.draggable);
					
					// Moved from .gallery-images?
					if ($draggable.parent().is('.gallery-image'))
					{
						$draggable.parent().hide();
					}
					// Moved within slider
					else
					{
						// Clean the old input
						$draggable.parent().find('input[type="hidden"]').val('');
					}
					
					// Remove the old image, store the image ID and append the image to slider
					$this
						.find('img')
							.remove()
							.end()
						.find('input[type="hidden"]')
							.val($draggable.attr('rel'))
							.end()
						.append($draggable);
					
					// Sometimes jQuery doesn't remove it automatically from multiple elements
					$j('#gallery-slides div').removeClass('droppable');
				}
			});
		}
		
		function sortableSlides()
		{
			$j('#gallery-slides').sortable
			({
				placeholder: 'sortable'
			});
		}
		
		droppableGallery($j('#gallery-slides div').not('.post'));
		sortableSlides();
		
		
		/**
		 * New gallery slide
		 */
		$j('#add-new-slide').click
		(
			function(event)
			{
				event.preventDefault();
				
				$slide = $j('<li/>')
					.append($j('#gallery-slide-pattern').children().clone())
					.appendTo($j('#gallery-slides'));
				
				droppableGallery($j('div', $slide).not('.post'));
				sortableSlides();
			}
		);
		
		
		/**
		 * Delete Slide / Image
		 */
		$j('#gallery-slides a.delete-image').live
		(
			'click',
			function(event)
			{
				event.preventDefault();
				
				$parent = $j(this).parent().addClass('deleteable');
				
				if (confirm('Are you sure you want to delete the selected image?'))
				{
					$parent
						.find('input[type="hidden"]')
							.val('')
							.end()
						.find('img')
							.remove();
				}
				
				$parent.removeClass('deleteable');
			}
		);
		
		$j('#gallery-slides a.delete-slide').live
		(
			'click',
			function(event)
			{
				event.preventDefault();
				
				$parent = $j(this).parent().addClass('deleteable');
				
				if (confirm('Are you sure you want to delete the selected slide?'))
				{
					$parent.remove();
				}
				else
				{
					$parent.removeClass('deleteable');
				}
			}
		);
	}
);