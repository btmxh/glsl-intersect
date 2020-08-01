//
// 3D Ray-AABB Intersection Test for GLSL 
// Reference: https://www.reddit.com/r/opengl/comments/8ntzz5/fast_glsl_ray_box_intersection/
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool testRayAABB(vec3 rayOrigin, vec3 rayDir, vec3 boxMin, vec3 boxMax) {
    vec3 rayInvDir = 1.0 / rayDir;
    vec3 tbot = rayInvDir * (boxMin - rayOrigin);
    vec3 ttop = rayInvDir * (boxMax - rayOrigin);
    vec3 tmin = min(ttop, tbot);
    vec3 tmax = max(ttop, tbot);
    vec2 t = max(tmin.xx, tmin.yz);
    float t0 = max(t.x, t.y);
    t = min(tmax.xx, tmax.yz);
    float t1 = min(t.x, t.y);
    return t1 > max(t0, 0.0);
}

#pragma glslify: export(testRayAABB)