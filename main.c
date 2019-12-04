#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>


static void gpio_setup(void)
{
	rcc_periph_clock_enable(RCC_GPIOD);
	gpio_mode_setup(GPIOD, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO12);
}


int main(void)
{
	int i;

	gpio_setup();

	while (1) {
		gpio_toggle(GPIOD, GPIO12);
		for (i = 0; i < 1000000; i++) {
			__asm__("nop");
		}
	}

	return 0;
}