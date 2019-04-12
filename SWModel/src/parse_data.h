#ifndef __PARSE_DATA_H
#define __PARSE_DATA_H

#include <string>
#include <vector>

std::vector<double> readLabels(std::string filename);
std::vector< std::vector<double> > readImages(std::string filename);

#endif