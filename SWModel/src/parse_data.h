#ifndef __PARSE_DATA_H
#define __PARSE_DATA_H

#include <string>
#include <vector>
#include <stdint.h>

std::vector<int> readLabels(std::string filename);
std::vector< std::vector<double> > readImages(std::string filename);

#endif