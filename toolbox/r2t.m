%R2T Convert rotation matrix to a homogeneous transform
%
% T = R2T(R) is an SE(2) or SE(3) homogeneous transform equivalent to an
% SO(2) or SO(3) orthonormal rotation matrix R with a zero translational
% component. Works for T in either SE(2) or SE(3):
%  - if R is 2x2 then T is 3x3, or
%  - if R is 3x3 then T is 4x4.
%
% Notes::
% - Translational component is zero.
% - For a rotation matrix sequence (KxKxN) returns a homogeneous transform
%   sequence (K+1xK+1xN).
%
% See also T2R.

% Copyright 2022-2023 Peter Corke, Witold Jachimczyk, Remo Pillat

function T = r2t(R)

% check dimensions: R is SO(2) or SO(3)
d = size(R);
assert(d(1) == d(2), 'SMTB:r2t:badarg', 'matrix must be square');
assert(any(d(1) == [2 3]), 'SMTB:r2t:badarg', 'argument is not a 2x2 or 3x3 rotation matrix (sequence)');

n = size(R,2);
Z = zeros(n,1);
B = [zeros(1,n) 1];

if numel(d) == 2
    % single matrix case
    T = [R Z; B];
else
    %  matrix sequence case
    T = zeros(n+1,n+1,d(3));
    for i=1:d(3)
        T(:,:,i) = [R(:,:,i) Z; B];
    end
end

end
