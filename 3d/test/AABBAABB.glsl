//
// 3D AABB-AABB Intersection Maths for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testAABBAABB(vec3 min1, vec3 max1, vec3 min2, vec3 max2) {
    return all(greaterThan(max1, min2)) && all(greaterThan(max2, min1));
}

#pragma glslify: export(testAABBAABB)