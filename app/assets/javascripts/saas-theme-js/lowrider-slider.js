/*!
 * Lowrider Slider
 *
 * @category    WorryFreeLabs
 * @package     Lowrider Slider
 * @copyright   Copyright (c) 2010 Worry Free Labs, LLC. (http://worryfreelabs.com/)
 * @author      Oleksandr Bernatskyi
 */
;jQuery(document).ready
(
	function()
	{
		/**
		 * Slider initialization
		 */
		jQuery('#lowrider-slider').threeWaySlider
		({
			animationDuration: 1200,
			mainSlideWidth: 630,
			mainSlideHeight: 400,
			secondSlideWidth: 310,
			secondSlideHeight: 190,
			thirdSlideWidth: 310,
			thirdSlideHeight: 190,
			controls: true,
			controlsContainer: '#lowrider-controls',
			autoMode: true,
			pauseInterval: 5000
		});
	}
);