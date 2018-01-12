%LAPLACE   Laplace operator
%
% SYNOPSIS:
%  image_out = laplace(image_in,sigma)
%
% DEFAULTS:
%  sigma = 1

% (C) Copyright 1999-2007               Pattern Recognition Group
%     All rights reserved               Faculty of Applied Physics
%                                       Delft University of Technology
%                                       Lorentzweg 1
%                                       2628 CJ Delft
%                                       The Netherlands
%
% Lucas van Vliet, May 2000.
% 10 October 2007: Using same method-selection logic as other derivative functions. (CL)

function image_out = laplace(varargin)

if nargin==0
   if exist('private/Laplace.jpg','file')
      image_out = dip_image(imread('private/Laplace.jpg'));
      return
   end
end

d = struct('menu','Differential Filters',...
           'display','Laplace operator',...
           'inparams',struct('name',       {'image_in',   'sigma'},...
                             'description',{'Input image','Sigma of Gaussian'},...
                             'type',       {'image',      'array'},...
                             'dim_check',  {0,            1},...
                             'range_check',{[],           'R+'},...
                             'required',   {1,            0},...
                             'default',    {'a',          1}...
                            ),...
           'outparams',struct('name',{'image_out'},...
                              'description',{'Output image'},...
                              'type',{'image'}...
                              )...
          );
if nargin == 1
   s = varargin{1};
   if ischar(s) & strcmp(s,'DIP_GetParamList')
      image_out = d;
      return
   end
end
try
   [image_in,sigma] = getparams(d,varargin{:});
catch
   if ~isempty(paramerror)
      error(paramerror)
   else
      error(firsterr)
   end
end

process = ones(size(sigma));
method = getderivativeflavour('choose',getderivativeflavour,sigma,process); % The order array is the same as the process array.
image_out = dip_laplace(image_in,process,sigma,method);
