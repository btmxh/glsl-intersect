//
// 3D Ray-Sphere Intersection Maths for GLSL 
// Version: 2020-08-01
//
// Copyright (c) 2020 Ngo Duy Anh. All rights reserved.
// Distributed under the MIT license. See LICENSE file.
// https://github.com/ngoduyanh/glsl-intersect
//

bool raySphereRad2(vec3 rayOrigin, vec3 rayDir, vec3 sphereCenter, float sphereRadius2, out vec2 result) {
    vec3 lvec = sphereCenter - rayOrigin;
    float tca = dot(lvec, rayDir);
    float d2 = dot(lvec, lvec) - tca * tca;
    if(d2 > sphereRadius2)   return false;
    float thc = sqrt(sphereRadius2 - d2);
    float t0 = tca - thc;
    float t1 = tca + thc;

    result = vec2(t0, t1);
    return (t0 < t1 && t1 >= 0);
}

#pragma glslify: export(raySphereRad2)