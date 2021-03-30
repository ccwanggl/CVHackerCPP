add_library(arithmetic ipb_arithmetic/sum.cpp
                        ipb_arithmetic/subtract.cpp)

install(TARGETS arithmetic DESTINATION lib)
install(FILES ipb_arithmetic.hpp DESTINATION include)
