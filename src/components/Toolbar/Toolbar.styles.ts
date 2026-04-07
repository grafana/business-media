import { css } from '@emotion/css';
import { GrafanaTheme2 } from '@grafana/data';

/**
 * Styles
 */
export const getStyles = (theme: GrafanaTheme2) => {
  return {
    toolbar: css`
      display: flex;
      align-items: center;
      gap: ${theme.spacing(0.5)};
      padding: ${theme.spacing(0.5, 1)};
      background: ${theme.colors.background.canvas};
      border-bottom: 1px solid ${theme.colors.border.weak};
    `,
    leftItems: css`
      display: flex;
      align-items: center;
      gap: ${theme.spacing(0.5)};
      flex-grow: 1;
    `,
    rightItems: css`
      display: flex;
      align-items: center;
      gap: ${theme.spacing(0.5)};
    `,
    zoom: css`
      [data-rmiz-modal-overlay='visible'] {
        background-color: ${theme.colors.background.primary};
    `,
  };
};
