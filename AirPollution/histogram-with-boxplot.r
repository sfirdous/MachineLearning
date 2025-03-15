hist.bp <- function( x, breaks = 'FD', bw = 'nrd0', density = TRUE, rug = TRUE, xlab = '', main = '', range = 1.5, exclude.outliers = FALSE, ... )
 {
  # check critical assumptions about arguments
  stopifnot( is.vector( x ), is.numeric( x ) )

  # bypass trivial cases
  if ( length( x ) < 2 )
   {
    # plot.new()
    # plot.window( xlim = 0:1, ylim = 0:1 )
    # text( 0.5, 0.5, "Too few data; can't to plot" )
    cat( "Too few data -- length( x ) ==", length( x ), "-- can't create histogram.\n" )
    return( invisible( NULL ) )
   }

  # compute histogram and boxplot without plotting them
  h <- hist( x, breaks, plot = FALSE )
  b <- boxplot( x, plot = FALSE, range = range )

  # adjust histogram window and plot them
  xlim <- if ( exclude.outliers ) range( b$stats ) else range( x )
  ymax <- max( if ( density ) h$density else h$counts )

  plot( h, freq = !density, xlim = xlim, ylim = c( 0, 1.1 * ymax ), main = main, xlab = xlab )
  bxp( b, horizontal = TRUE, add = TRUE, at = 1.05 * ymax, frame.plot = FALSE, boxwex = 0.1 * ymax, ... )
  abline( v = mean( x ), col = 'blue' )
  axis( 3, at = mean( x ), lab = 'Average', col = 'blue', col.axis = 'blue' )
  abline( v = median( x ), col = 'green' )
  axis( 3, at = median( x ), lab = 'Median', col = 'green', col.axis = 'green' )
  title( sub = paste( 'Count:', length( x ) ) )

  if ( rug ) rug( x )
  if ( density ) lines( density( x, bw ), col = 'red' )

  # return boxplot stats invisibly
  invisible( b$stats )
 }
