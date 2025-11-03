// Jest setup provided by Grafana scaffolding
import './.config/jest-setup';

import { TextDecoder, TextEncoder } from 'util';
import ResizeObserver from 'resize-observer-polyfill';

// mock the intersection observer and just say everything is in view
const mockIntersectionObserver = jest
  .fn()
  .mockImplementation((callback: (arg: IntersectionObserverEntry[]) => void) => ({
    observe: jest.fn().mockImplementation((elem: HTMLElement) => {
      callback([{ target: elem, isIntersecting: true }] as unknown as IntersectionObserverEntry[]);
    }),
    unobserve: jest.fn(),
    disconnect: jest.fn(),
  }));

/**
 * Assign Text Decoder and Encoder which are required in @grafana/ui
 */
Object.assign(global, {
  IntersectionObserver: mockIntersectionObserver,
  ResizeObserver,
  TextDecoder,
  TextEncoder,
});
