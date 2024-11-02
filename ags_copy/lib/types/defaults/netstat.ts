import { RateUnit } from '../bar';
import { NetworkResourceData } from '../customModules/network';

export const GET_DEFAULT_NETSTAT_DATA = (dataType: RateUnit): NetworkResourceData => {
    if (dataType === 'auto') {
        return { in: `...`, out: `...` };
    }

    return { in: `0 ${dataType}/s`, out: `0 ${dataType}/s` };
};
