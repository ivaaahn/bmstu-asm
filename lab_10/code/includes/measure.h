#pragma once

#include "settings.h"


typedef void dot_product_implement(double *, const DoubleVector *, const DoubleVector *, int);

void measure(dot_product_implement *dot_prod);