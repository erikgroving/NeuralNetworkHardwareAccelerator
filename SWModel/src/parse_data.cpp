#include "parse_data.h"
#include <fstream>
#include <iostream>

std::vector< std::vector<double> > readImages(std::string s) {
    std::ifstream f(s, std::ios::binary | std::ios::in);

    std::vector< std::vector<double> > data;
    uint8_t pixel;
    //int res;
    //uint32_t images;
    uint32_t rows;
    uint32_t cols;

    uint8_t buf[4];


    f.read((char*)&buf, 4);  // magic number
    /*res = buf[3] + (buf[2] << 8) + (buf[1] << 16) + (buf[0] << 24);*/
    f.read((char*)&buf, 4);  // number of images
    /*images = buf[3] + (buf[2] << 8) + (buf[1] << 16) + (buf[0] << 24);*/
    f.read((char*)&buf, 4);  // number of rows
    rows = buf[3] + (buf[2] << 8) + (buf[1] << 16) + (buf[0] << 24);
    f.read((char*)&buf, 4);  // number of cols
    cols = buf[3] + (buf[2] << 8) + (buf[1] << 16) + (buf[0] << 24);

    //std::cout << res << " " << images << " " <<rows <<" "<< cols << std::endl;

    while(!f.eof()) {
        // read an image
        std::vector<double> img;
        for (unsigned i = 0; i < rows * cols; i++) {
            f.read((char*)&pixel, 1);
            double p = ((double)pixel / 255.) ;
            img.push_back(p);
        }
        if (!f.eof()) {
            data.push_back(img);
        }
    }
    f.close();
    return data;
}

std::vector<int> readLabels(std::string s) {
    std::ifstream f(s, std::ios::binary | std::ios::in);
    std::vector<int> labels;
    uint8_t label;
    int32_t res;
    f.read((char*)&res, 4);   // magic number
    f.read((char*)&res, 4);   // number of items
    f.read((char*)&label, 1);
    while(!f.eof()) {
        labels.push_back((int)label);     
        f.read((char*)&label, 1);
    }
    f.close();
    return labels;
}