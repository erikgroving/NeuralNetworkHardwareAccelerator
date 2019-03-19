#include <vector>
class Layer {
public:
    virtual void forward(std::vector<double>) = 0;
};