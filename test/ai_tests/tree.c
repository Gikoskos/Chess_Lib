/********************************************************************
 *                              tree.c                              *
 *          various tests for the AI move tree functions            *
 *                                                                  *
 *                 (C)2015 <cyberchiller@gmail.com>                 *
 *                                                                  *
 ********************************************************************/

#include <chesslib.h>
#include <chlib-cli.h> 

#define TEST_DEPTH 2

int main(void)
{
	clock_t start, stop;
	double total_time_elapsed;
	start = clock();
	ch_template chb[8][8];
	initChessboard(chb);
	getAImove(chb, WHITE, TEST_DEPTH);
	stop = clock();
	total_time_elapsed = ((double)(stop-start))/CLOCKS_PER_SEC;
	printf("At depth %d time elapsed is %lf seconds.\n", TEST_DEPTH, total_time_elapsed);
	return 0;
}
